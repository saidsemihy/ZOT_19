*&---------------------------------------------------------------------*
*& Report zot_19_p_oop_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_oop_1.

PARAMETERS: p_num1 TYPE int4,
            p_num2 TYPE int4.

DATA: gv_sum TYPE int4.
CLASS lcl_main DEFINITION DEFERRED. "Amacı go_main tanınmıyor hatası vermesin sonra tanımlıyacağım diyorum burda.
DATA: go_main TYPE REF TO lcl_main.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      sum_numbers,
      sub_numbers.

    DATA: mv_sum TYPE int4,
          mv_sub type int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD sum_numbers.
    gv_sum = p_num1 + p_num2.
    mv_sum = p_num1 + p_num2.
  ENDMETHOD.

  METHOD sub_numbers.
  mv_sub = p_num1 - p_num2.
  ENDMETHOD.
ENDCLASS.



START-OF-SELECTION.

  CREATE OBJECT go_main.

  go_main->sum_numbers( ).
  WRITE: / 'Toplamı = ',gv_sum.
  WRITE: /  'Local Değişkenin Toplamı = ',go_main->mv_sum.

  go_main->sub_numbers( ).
  WRITE: / 'Farkı = ',go_main->mv_sub.
