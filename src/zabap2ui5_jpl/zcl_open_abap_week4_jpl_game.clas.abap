CLASS zcl_open_abap_week4_jpl_game DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS fill_engine_script CHANGING engine TYPE REF TO zcl_axage_engine.
    METHODS execute_engine_action CHANGING engine TYPE REF TO zcl_axage_engine
                                           co_result TYPE REF TO zcl_axage_result .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_open_abap_week4_jpl_game IMPLEMENTATION.

  METHOD fill_engine_script.
    DATA bill_developer TYPE REF TO zcl_axage_actor.
    DATA mark_consultant TYPE REF TO zcl_axage_actor.

    engine = NEW #( ).
    DATA(entrance)   = NEW zcl_axage_room( name = 'Entrance' descr = 'You are in the entrance area. Welcome.' ).
    DATA(developer)  = NEW zcl_axage_room( name = 'Developers office' descr = 'The developers area. be quiet!' ).
    DATA(consulting) = NEW zcl_axage_room( name = 'Consulting Department' descr = 'This is the area where the consultants work. Bring coffee!' ).

    engine->map->add_room( entrance ).
    engine->map->add_room( developer ).
    engine->map->add_room( consulting ).
    engine->map->set_floor_plan( VALUE #(
      ( `+--------------------+ +--------------------+` )
      ( `|                    | |                    |` )
      ( `|                    | |                    |` )
      ( `|                    +-+                    |` )
      ( `|     ENTRANCE              DEVELOPERS      |` )
      ( `|                    +-+                    |` )
      ( `|                    | |                    |` )
      ( `|                    | |                    |` )
      ( `+--------+  +--------+ +--------------------+` )
      ( `         |  |` )
      ( `+--------+  +--------+` )
      ( `|                    |` )
      ( `|                    |` )
      ( `|                    |` )
      ( `|   CONSULTANTS      |` )
      ( `|                    |` )
      ( `|                    |` )
      ( `|                    |` )
      ( `+--------------------+` ) ) ).

    entrance->set_exits(
      e = developer
      s = consulting ).
    developer->set_exits(
      w = entrance ).
    consulting->set_exits(
      n = entrance ).
    DATA(cutter_knife) = NEW zcl_axage_thing( name = 'KNIFE' descr = 'a very sharp cutter knife' ).
    developer->things->add( cutter_knife ).
    DATA(needed_to_open_box) = NEW zcl_axage_thing_list(  ).
    needed_to_open_box->add( cutter_knife ).
    DATA(content_of_box) = NEW zcl_axage_thing_list( ).
    content_of_box->add( NEW zcl_axage_thing( name = 'RFC' descr = 'The request for change.' ) ).
    DATA(card_box) = NEW zcl_axage_openable_thing(
      name    = 'BOX'
      descr   = 'a little card box'
      content = content_of_box
      needed  = needed_to_open_box ).
    consulting->things->add( card_box ).

    engine->player->set_location( entrance ).

    bill_developer = NEW #( name = 'Bill' descr = 'An ABAP developer' ).
    bill_developer->set_location( developer ).
    bill_developer->add_sentences( VALUE #(
      ( |Hey, I am Bill, an experienced ABAP developer.| )
      ( |If you have programming tasks for me, you can pass the requirement to me| ) ) ).

    mark_consultant = NEW #( name = 'Mark' descr = 'An SAP consultant' ).
    mark_consultant->set_location( consulting ).
    mark_consultant->add_sentences( VALUE #(
      ( |Hello, My name is Mark and I am an SAP consultant| )
      ( |You can ask me anything about SAP processes.| ) ) ).

    engine->actors->add( bill_developer ).
    engine->actors->add( mark_consultant ).
  ENDMETHOD.

  METHOD execute_engine_action.
*    IF engine->player->location->things->exists( 'RFC' ).
*      engine->mission_completed = abap_true.
*      co_result->add( 'Congratulations! You delivered the RFC to the developers!' ).
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
