CLASS ycl_ca_lab_hello_gitworld DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS say_hello_to IMPORTING iv_name           TYPE string
                         RETURNING VALUE(rv_message) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS YCL_CA_LAB_HELLO_GITWORLD IMPLEMENTATION.


  METHOD say_hello_to.
    rv_message = |Hello GIT World to { iv_name }|.
  ENDMETHOD.
ENDCLASS.
