*&---------------------------------------------------------------------*
*& Report zot_19_p_oop_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_oop_3.

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

DATA: gv_sum          TYPE int4,
      gv_changing_num TYPE int4.

CLASS lcl_main DEFINITION DEFERRED. "Amacı go_main tanınmıyor hatası vermesin sonra tanımlıyacağım diyorum burda.
DATA: go_main TYPE REF TO lcl_main.


CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      sum_numbers,
*      constructor,
      constructor IMPORTING iv_num1 type int4
                            iv_num2 type int4.



    DATA: mv_num1 TYPE int4,
          mv_num2 TYPE int4,
          mv_sum  TYPE int4,
          mv_sub  TYPE int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD sum_numbers.
    mv_sum = mv_num1 + mv_num2.
  ENDMETHOD.

  METHOD constructor.
    mv_num1 = iv_num1.
    mv_num2 = iv_num2.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.

  CREATE OBJECT go_main
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2.

*  go_main->mv_num1 = p_num1.
*  go_main->mv_num2 = p_num2.

  go_main->sum_numbers( ).

  WRITE: / 'Toplamı = ',go_main->mv_sum.
