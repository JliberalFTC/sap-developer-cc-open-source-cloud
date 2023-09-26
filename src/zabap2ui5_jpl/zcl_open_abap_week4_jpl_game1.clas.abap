CLASS zcl_open_abap_week4_jpl_game1 DEFINITION
PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.

    DATA command TYPE string.
    DATA results TYPE string.
    DATA help TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA bill_developer TYPE REF TO zcl_axage_actor.
    DATA mark_consultant TYPE REF TO zcl_axage_actor.
    DATA engine TYPE REF TO zcl_axage_engine.
    DATA lo_game_crtl TYPE REF TO zcl_open_abap_week4_jpl_game2.
    DATA check_initialized TYPE abap_bool.
    METHODS init_game.
ENDCLASS.



CLASS ZCL_OPEN_ABAP_WEEK4_JPL_GAME1 IMPLEMENTATION.


  METHOD init_game.
    lo_game_crtl = NEW #(  ).
    lo_game_crtl->fill_engine_script( CHANGING engine = engine ).
  ENDMETHOD.


  METHOD z2ui5_if_app~main.
*    IF check_initialized = abap_false.
*      check_initialized = abap_true.
*      "Plot
*      data(lv_plot) = |Game Plot: You are at SAP headquarters during an emergency situation. A security breach has occurred. | &&
*      |With limited resources and three key players to help you, Your mission, should you choose to accept it (Wink), is to navigate through the rooms, gather evidence, and get the problem corrected.|.
*      results = |{ lv_plot } \n | &&  results.
*      "Init Command
*      command = 'MAP'.
*      init_game(  ).
*      help = engine->interprete( 'HELP' )->get( ).
*    ENDIF.
*
*    CASE client->get( )-event.
*      WHEN 'BUTTON_POST'.
*        client->popup_message_toast( |{ command } - send to the server| ).
*        DATA(result) = engine->interprete( command ).
*        result->add( |You are in the { engine->player->location->name }.| ).
*
*        "USB Decrypt
*        IF engine->player->location->name = 'Security Department' AND engine->player->location->things->exists( 'USB' ).
*           DATA(thing_usbd) = NEW zcl_axage_thing( name = 'DECRYPTED USB' descr = 'A USB drive with valuable information about security breaches' ).
*           engine->player->location->things->delete( 'USB' ).
*           engine->player->location->things->add( thing_usbd ).
*          result->add( 'You gave the USB to the SAP security officer, who decrypted it!' ).
*        ENDIF.
*
*        "USB Analysis
*        IF engine->player->location->name = 'Entrance' AND engine->player->location->things->exists( 'DECRYPTED USB' ) AND engine->player->location->things->exists( 'QR CARD' ).
*           DATA(thing_file) = NEW zcl_axage_thing( name = 'FILE' descr = 'A File with massive information on all recent Business Processes excecuted' ).
*           engine->player->location->things->add( thing_file ).
*          result->add( 'You connect the USB drive to the notebook and manage to access a file, which you print.' ).
*        ENDIF.
*
*        "File Analysis
*        IF engine->player->location->name = 'SAP Business Process Consulting Department' AND engine->player->location->things->exists( 'FILE' ).
*           DATA(thing_rfc) = NEW zcl_axage_thing( name = 'RFC' descr = 'The request for change.' ).
*           engine->player->location->things->add( thing_rfc ).
*          result->add( 'You deliver the File to the Expert, who writes an RFC for the developer to create an APP that isolates the compromised transactions.' ).
*        ENDIF.
*
*        "Notebook unlock
*        IF engine->player->location->name = 'Entrance' AND engine->player->location->things->exists( 'QR CARD' ).
*           DATA(thing_pc) = NEW zcl_axage_thing( name = 'NOTEBOOK' descr = 'A portable computer with a compatible USB port. It is unlocked' ).
*           engine->player->location->things->delete( 'NOTEBOOK' ).
*           engine->player->location->things->add( thing_pc ).
*          result->add( 'You have unlocked the Notebook, it can be used while the QR Card is dropped!' ).
*        ELSEIF engine->player->location->name = 'Entrance' AND not engine->player->location->things->exists( 'QR CARD' ).
*            thing_pc = NEW zcl_axage_thing( name = 'NOTEBOOK' descr = 'A portable computer with a compatible USB port. It is locked with some QR mechanism.' ).
*            engine->player->location->things->delete( 'NOTEBOOK' ).
*            engine->player->location->things->add( thing_pc ).
*        ENDIF.
*
*        "End
*        IF engine->player->location->name = 'SAP Developers office' AND engine->player->location->things->exists( 'RFC' ).
*          result->add( 'You deliver the RFC to the Development Expert, who writes a marvelous code to create the app requested' ).
*          result->add( 'Congratulations! You complete the game!' ).
*          engine->mission_completed = abap_true.
*        ENDIF.
*
*        "Fill Result Log
*        results = |{ result->get(  ) } \n **************************** \n| &&  results.
*
*      WHEN 'BACK'.
*        client->nav_app_leave( client->get_app( client->get( )-id_prev_app_stack  ) ).
*    ENDCASE.
*
*    DATA(view) = z2ui5_cl_xml_view=>factory( )->shell( ).
*    DATA(page) = view->page(
*      title          = 'abap2UI5 and AXAGE - ABAP teX Adventure #2'
*      navbuttonpress = client->_event( 'BACK' )
*      shownavbutton  = abap_false
*    ).
*    page->header_content(
*         )->link(
*             text = 'Source_Code'
*             href = z2ui5_cl_xml_view=>hlp_get_source_code_url( app = me get = client->get( ) )
*             target = '_blank'
*     ).
*
*    DATA(grid) = page->grid( 'L12 M12 S12' )->content( 'layout' ).
*    grid->simple_form(
*        title = 'Axage' editable = abap_true
*        )->content( 'form'
*            )->title( 'Game Input'
*            )->label( 'Command'
*            )->input( client->_bind( command )
*            )->button(
*                text  = 'Execute Command'
*                press = client->_event( 'BUTTON_POST' ) ).
*
*    page->grid( 'L8 M8 S8' )->content( 'layout' ).
*    grid->simple_form( title = 'Game Console' editable = abap_true )->content( 'form'
*        )->code_editor( value = client->_bind( results ) editable = 'false' type = `plain_text`
*                      height = '600px'
*        )->text_area( value = client->_bind( help ) editable = 'false' growingmaxlines = '40' growing = abap_True
*                      height = '600px'
*        ).
*    client->set_next( VALUE #( xml_main = page->get_root( )->xml_get( ) ) ).

  ENDMETHOD.
ENDCLASS.
