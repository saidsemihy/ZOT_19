CLASS zcl_ot_19_mat_ops DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
 METHODS: calculate_result
      IMPORTING iv_number1   TYPE i
                iv_number2   TYPE i
                iv_operation TYPE c
      EXPORTING ev_result    TYPE i.


ENDCLASS.



CLASS zcl_ot_19_mat_ops IMPLEMENTATION.
METHOD calculate_result.

    CASE iv_operation.
      WHEN '+'.
        ev_result = iv_number1 + iv_number2.
      WHEN '-'.
        ev_result = iv_number1 - iv_number2.
      WHEN '*'.
        ev_result = iv_number1 * iv_number2.
      WHEN '/'.
        ev_result = iv_number1 / iv_number2.
    ENDCASE.

  ENDMETHOD.


ENDCLASS.
