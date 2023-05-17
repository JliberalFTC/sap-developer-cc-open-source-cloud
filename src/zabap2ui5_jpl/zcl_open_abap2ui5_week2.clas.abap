CLASS zcl_open_abap2ui5_week2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.

    DATA:
      BEGIN OF screen,
        user_name  TYPE string,
        input_date TYPE string,
      END OF screen.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_open_abap2ui5_week2 IMPLEMENTATION.
  METHOD z2ui5_if_app~main.


    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->popup_message_toast( |App executed on { screen-input_date } by { screen-user_name }| ).
      WHEN 'BACK'.
        client->nav_app_leave( client->get_app( client->get( )-id_prev_app_stack  ) ).
    ENDCASE.

    client->set_next( VALUE #( xml_main = Z2UI5_CL_XML_VIEW=>factory(
        )->shell(
        )->page(
                title          = 'SAP Developer Code Challenge – Open-Source ABAP (Week 2)'
                navbuttonpress = client->_event( 'BACK' )
                shownavbutton  = abap_true
            )->header_content(
                )->link(
                    text = 'Source_Code'
                    href = Z2UI5_CL_XML_VIEW=>hlp_get_source_code_url( app = me get = client->get( ) )
                    target = '_blank'
            )->get_parent(
            )->simple_form( title = 'Form Title' editable = abap_true
                )->content( 'form'
                    )->title( 'Input'
                    )->label( 'User'
                    )->input( value = client->_bind( screen-user_name )
                    )->label( 'Date'
                    )->date_picker( client->_bind( screen-input_date )
                    )->button(
                        text  = 'post'
                        press = client->_event( 'BUTTON_POST' )
         )->get_root( )->xml_get( ) ) ).



*    "event handling
*    CASE client->get( )-event.
*      WHEN 'BUTTON_POST'.
*        client->popup_message_toast( |App executed on { input_date } by { user_name }| ).
*    ENDCASE.
*
*    "view rendering
*    client->set_next( VALUE #( xml_main = z2ui5_cl_xml_view=>factory(
*        )->page( title = 'abap2UI5 - First Example'
*            )->simple_form( title = 'Form Title' editable = abap_true
*                )->content( 'form'
*                    )->title( 'Input'
*                    )->label( 'User'
*                    )->input( client->_bind( user_name )
*                    )->label( 'Date'
*                    )->date_picker( client->_bind( input_date )
*                    )->button( text  = 'Post' press = client->_event( 'BUTTON_POST' )
*         )->get_root( )->xml_get( ) ) ).
  ENDMETHOD.

ENDCLASS.
