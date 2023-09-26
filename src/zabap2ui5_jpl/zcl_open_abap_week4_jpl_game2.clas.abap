CLASS zcl_open_abap_week4_jpl_game2 DEFINITION
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



CLASS ZCL_OPEN_ABAP_WEEK4_JPL_GAME2 IMPLEMENTATION.


  METHOD execute_engine_action.
    IF engine->player->location->name = 'Security Department' and engine->player->location->things->exists( 'USB' ).
      co_result->add( 'You delivered the USB to the SAP security officer!' ).
    ENDIF.
  ENDMETHOD.


  METHOD fill_engine_script.
    DATA actor_developer TYPE REF TO zcl_axage_actor.
    DATA actor_consultant TYPE REF TO zcl_axage_actor.
    DATA actor_security TYPE REF TO zcl_axage_actor.

    engine = NEW #( ).
    DATA(entrance)   = NEW zcl_axage_room( name = 'Entrance' descr = 'You are in the entrance area. Welcome.' ).
    DATA(developer)  = NEW zcl_axage_room( name = 'SAP Developers office' descr = 'The developers area. be quiet!' ).
    DATA(consulting) = NEW zcl_axage_room( name = 'SAP Business Process Consulting Department' descr = 'This is the area where the Business Process Experts work. !' ).
    DATA(security)   = NEW zcl_axage_room( name = 'Security Department' descr = 'This is the area where the facilities are supervised.!' ).

    engine->map->add_room( entrance ).
    engine->map->add_room( developer ).
    engine->map->add_room( consulting ).
    engine->map->add_room( security ).

    engine->map->set_floor_plan( VALUE #(
      ( `+--------+  +--------+ ` )
      ( `|                    | ` )
      ( `|                    | ` )
      ( `|         SAP        | ` )
      ( `|   BUSINESS PROCESS | ` )
      ( `|      CONSULTING    | ` )
      ( `|      DEPARTMENT    | ` )
      ( `|                    | ` )
      ( `+---------  ---------+ ` )
      ( `         |  |          ` )
      ( `+--------+  +--------+ +--------------------+ ` )
      ( `|                    | |                    | ` )
      ( `|                    | |                    | ` )
      ( `+                    +-+     SECURITY       | ` )
      ( `      ENTRANCE               DEPARTMENT     | ` )
      ( `+                    +-+                    | ` )
      ( `|                    | |                    | ` )
      ( `|                    | |                    | ` )
      ( `+--------+  +--------+ +--------------------+ ` )
      ( `         |  |          ` )
      ( `+--------+  +--------+ ` )
      ( `|                    | ` )
      ( `|                    | ` )
      ( `|        SAP         | ` )
      ( `|     DEVELOPERS     | ` )
      ( `|      OFFICE        | ` )
      ( `|                    | ` )
      ( `|                    | ` )
      ( `+--------------------+ ` )  ) ).

    "Navigation
    entrance->set_exits(
      n = consulting
      e = security
      s = developer ).
    developer->set_exits(
      n = entrance ).
    consulting->set_exits(
      s = entrance ).
    security->set_exits(
      w = entrance ).
    "Things
    DATA(thing_usb) = NEW zcl_axage_thing( name = 'USB' descr = 'A USB drive. It is encrypted and requires decryption to access its contents' ).
    developer->things->add( thing_usb ).
    DATA(thing_pc) = NEW zcl_axage_thing( name = 'NOTEBOOK' descr = 'A portable computer with a compatible USB port. It is locked with some QR mechanism.' ).
    entrance->things->add( thing_pc ).
    DATA(thing_key) = NEW zcl_axage_thing( name = 'KEY' descr = 'A desk drawer key' ).
    consulting->things->add( thing_key ).
    DATA(thing_qr) = NEW zcl_axage_thing( name = 'QR CARD' descr = 'A Card With a QR Password unlock machanism' ).



    DATA(needed_to_open_drawer) = NEW zcl_axage_thing_list(  ).
    needed_to_open_drawer->add( thing_key ).
    DATA(content_of_drawer) = NEW zcl_axage_thing_list( ).
    content_of_drawer->add( thing_qr ).
    DATA(desk_drawer) = NEW zcl_axage_openable_thing(
      name    = 'DESKDRAWER'
      descr   = 'A desk drawer'
      content = content_of_drawer
      needed  = needed_to_open_drawer ).
    entrance->things->add( desk_drawer ).

    engine->player->set_location( entrance ).
    "Actors
    actor_developer = NEW #( name = 'John' descr = 'A SAP Full Stack developer' ).
    actor_developer->set_location( developer ).
    actor_developer->add_sentences( VALUE #(
      ( |Hey, I am Joel...| )
      ( |If you have programming needs, I'm the man!| ) ) ).

    actor_consultant = NEW #( name = 'Jeff' descr = 'An SAP consultant' ).
    actor_consultant->set_location( consulting ).
    actor_consultant->add_sentences( VALUE #(
      ( |Hello, My name is Jeff and I am an SAP consultant| )
      ( |You can ask me anything about SAP processes.| ) ) ).

    actor_security = NEW #( name = 'Joe' descr = 'An SAP Security officer' ).
    actor_security->set_location( security ).
    actor_security->add_sentences( VALUE #(
      ( |Hello, My name is Tom and I am an SAP security consultant| )
      ( |You can ask me anything about SAP security, like decryption and other stuff.| ) ) ).

    engine->actors->add( actor_developer ).
    engine->actors->add( actor_consultant ).
    engine->actors->add( actor_security ).
  ENDMETHOD.
ENDCLASS.
