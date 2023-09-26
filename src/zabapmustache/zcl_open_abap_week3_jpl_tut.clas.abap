CLASS zcl_open_abap_week3_jpl_tut DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    INTERFACES if_http_service_extension .
    CLASS-METHODS display_backlog.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: tasks TYPE zstr_openabap_jpl_blog.
    METHODS fill_data RETURNING VALUE(rs_data) TYPE zstr_openabap_jpl_blog.
    METHODS get_timestamp RETURNING VALUE(rv_datetime) TYPE timestampl.
    METHODS process_data IMPORTING is_data          TYPE zstr_openabap_jpl_blog
                         RETURNING VALUE(rv_render) TYPE string.
    METHODS get_styles
      RETURNING
        VALUE(r_result) TYPE string.
ENDCLASS.



CLASS ZCL_OPEN_ABAP_WEEK3_JPL_TUT IMPLEMENTATION.


  METHOD display_backlog.
    "Object creation
    DATA(lo_ctrl) = NEW zcl_open_abap_week3_jpl_tut(  ).
    "Fill output Data
    DATA(ls_data) = lo_ctrl->fill_data(  ).
    "Process data
    lo_ctrl->process_data( ls_data ).
  ENDMETHOD.


  METHOD fill_data.
    DATA lv_time TYPE timestampl.

    TRY.
        rs_data = VALUE #( backlog_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( )
                           backlog_date = me->get_timestamp( )
                           backlog_desc = |SAP Developer Code Challenge – ABAP Mustache (Week 3)|
                           backlog_tasks = VALUE #(
                                                ( task_id = CONV #( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) )
                                                  task_status = 'COMPLETED'
                                                  task_created = |05/10/2023:T20:00:00|
                                                  task_desc = |Week 1 - ABAPGIT|
                                                  task_comments = VALUE #(
                                                    ( task_date = |05/10/2023:T20:00:00|
                                                      task_status = 'CREATED'
                                                      task_comment = |May 10th, 2023 – Start of Challenge: Week 1 Challenge - Creation| )
                                                    ( task_date = |05/11/2023:T20:00:00|
                                                      task_status = 'SUBMITTED'
                                                      task_comment = |May 10th, 2023 – Start of Challenge: Week 1 Challenge - Submission| )
                                                    ( task_date = |05/12/2023:T20:00:00|
                                                      task_status = 'GRADED'
                                                      task_comment = |May 10th, 2023 – Start of Challenge: Week 1 Challenge - Grade| )
                                                  )
                                                )

                                                ( task_id = CONV #( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) )
                                                  task_status = 'COMPLETED'
                                                  task_created = |05/17/2023:T20:00:00|
                                                  task_desc = |Week 2 - ABAP2UI5|
                                                  task_comments = VALUE #(
                                                    ( task_date = |05/17/2023:T20:00:00|
                                                      task_status = 'CREATED'
                                                      task_comment = |May 17th, 2023 – Week 2 Challenge  - Creation| )
                                                    ( task_date = |05/18/2023:T20:00:00|
                                                      task_status = 'SUBMITTED'
                                                      task_comment = |May 17th, 2023 – Week 2 Challenge  - Submission| )
                                                    ( task_date = |05/19/2023:T20:00:00|
                                                      task_status = 'GRADED'
                                                      task_comment = |May 17th, 2023 – Week 2 Challenge  - Grade| )
                                                  )
                                                )

                                                ( task_id = CONV #( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) )
                                                  task_status = 'SUBMITTED'
                                                  task_created = |05/24/2023:T20:00:00|
                                                  task_desc = |Week 3 - ABAPMUSTACHE|
                                                  task_comments = VALUE #(
                                                    ( task_date = |05/24/2023:T20:00:00|
                                                      task_status = 'CREATED'
                                                      task_comment = |May 24th, 2023 – Week 3 Challenge - Creation| )
                                                    ( task_date = |05/25/2023:T20:00:00|
                                                      task_status = 'SUBMITTED'
                                                      task_comment = |May 24th, 2023 – Week 3 Challenge - Submission| )
                                                  )
                                                )
                                            )
                         ).
      CATCH  cx_uuid_error  INTO DATA(lo_error).
    ENDTRY.

  ENDMETHOD.


  METHOD get_styles.
    DATA(lv_root_html) = 'body{font-family:"Roboto", sans-serif;font-weight: 300;font-size: 17px;font-family: "Roboto", sans-serif;background-color: #f5f5f5;width: 100vw;' &&
                         'height: 100vh;color: #444857;display: flex;flex-direction: column;align-items: center;justify-content: center;overflow: hidden;}'.
    DATA(lv_root_table) = 'table{width: 100%;border-collapse: collapse;padding: 15px;}tr{padding: 5px;width: 100%;}td{padding-left: 10px;padding-right: 10px;}'.
    DATA(lv_root_tableheader) = '.tableheader{color: #fdfdfd;background-color: #444857;}'.
    DATA(lv_root_tablerow) = '.tablerow{color: #444857;background-color: #fdfdfd;border-bottom: 1px solid #dddddd;}'.
    r_result = |<style>{ lv_root_html }{ lv_root_table }{ lv_root_tableheader }{ lv_root_tablerow }</style>|.
  ENDMETHOD.


  METHOD get_timestamp.
    GET TIME STAMP FIELD rv_datetime.
  ENDMETHOD.


  METHOD if_http_service_extension~handle_request.
    "Object creation
    DATA(lo_ctrl) = NEW zcl_open_abap_week3_jpl_tut(  ).
    "Fill output Data
    DATA(ls_data) = lo_ctrl->fill_data(  ).
    "Process data
    DATA(lv_response) = lo_ctrl->process_data( ls_data ).
    response->set_status( 200 ).
    response->set_text( lv_response ).
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    "Object creation
    DATA(lo_ctrl) = NEW zcl_open_abap_week3_jpl_tut(  ).
    "Fill output Data
    DATA(ls_data) = lo_ctrl->fill_data(  ).
    "Process data
    lo_ctrl->process_data( ls_data ).
  ENDMETHOD.


  METHOD process_data.
    CONSTANTS c_nl TYPE abap_char1 VALUE cl_abap_char_utilities=>newline.
    DATA lo_mustache TYPE REF TO zcl_abap_mustache_steampunk.

    TRY.
        lo_mustache = zcl_abap_mustache_steampunk=>create(
          '<h2>Backlog: <b>{{backlog_id}}</b>: {{backlog_desc}}</h2><br>' && c_nl &&
          'Tasks:' && c_nl &&
          '<table>' && c_nl &&
          ' <tr class="tableheader"><td>Task description</td><td>Status</td><td>Comments</td></tr>' && c_nl &&
          ' {{#backlog_tasks}}' && c_nl &&
          '     <tr class="tablerow"><td>{{task_desc}}</td><td>{{task_status}}</td><td>' && c_nl &&
          '         <table>' && c_nl &&
          '           {{#task_comments}}' && c_nl &&
          '              <tr><td>Date:</td><td>{{task_date}}</td></tr>' && c_nl &&
          '              <tr><td>Status:</td><td>{{task_status}}</td></tr>' && c_nl &&
          '              <tr><td>Comment:</td><td>{{task_comment}}</td></tr>' && c_nl &&
          '           {{/task_comments}}' && c_nl &&
          '         </table>' && c_nl &&
          '     </td></tr>' && c_nl &&
          ' {{/backlog_tasks}}' && c_nl &&
          '</table>' ).

        DATA(lv_Response) = lo_mustache->render( is_data ).
        DATA(lv_style) = me->get_styles(  ).
        DATA(lv_header) = |<head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Document</title>{ lv_style }</head>|.
        DATA(lv_body) = |<body> { lv_Response }</body>|.
        rv_render = |<!DOCTYPE html><html lang="en">{ lv_header }{ lv_body }</html>|.
      CATCH zcx_mustache_error INTO DATA(lo_error).
        rv_render = lo_error->get_text(  ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
