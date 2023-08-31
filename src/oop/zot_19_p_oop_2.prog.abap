*&---------------------------------------------------------------------*
*& Report zot_19_p_oop_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_oop_2.

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
      sub_numbers,
      sum_numbers_v2 IMPORTING iv_num1 TYPE int4
                               iv_num2 TYPE int4
                     EXPORTING ev_sum  TYPE int4,

      sub_numbers_v2 IMPORTING iv_num1 TYPE int4
                     CHANGING  cv_num2 TYPE int4, "Changing farkı girişi çıkış olarak alıyosun

      sum_numbers_v3 IMPORTING iv_num1       TYPE int4
                               iv_num2       TYPE int4
                     RETURNING VALUE(rv_sum) TYPE int4. "Returningin exportingden farkı direk değişkene atabiliyoruz

    DATA: mv_sum TYPE int4,
          mv_sub TYPE int4.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD sum_numbers.
    mv_sum = p_num1 + p_num2.
  ENDMETHOD.

  METHOD sub_numbers.
    mv_sub = p_num1 - p_num2.
  ENDMETHOD.

  METHOD sum_numbers_v2.
    ev_sum = iv_num1 + iv_num2.
  ENDMETHOD.

  METHOD sub_numbers_v2.
    cv_num2 = iv_num1 - cv_num2.
  ENDMETHOD.

  METHOD sum_numbers_v3.
    rv_sum = iv_num1 + iv_num2.
  ENDMETHOD.

ENDCLASS.



START-OF-SELECTION.

  CREATE OBJECT go_main.

  go_main->sum_numbers( ).
  WRITE: /  'Local Değişkenin Toplamı = ',go_main->mv_sum.

  go_main->sub_numbers( ).
  WRITE: / 'Farkı = ',go_main->mv_sub.

  go_main->sum_numbers_v2(
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2
    IMPORTING
      ev_sum  = gv_sum
  ).
  WRITE: / 'Toplam V2 = ',gv_sum.

  gv_changing_num = p_num2.
  go_main->sub_numbers_v2(
    EXPORTING
      iv_num1 = p_num1
    CHANGING
      cv_num2 = gv_changing_num
  ).
  WRITE: / 'Fark V2 = ',gv_changing_num.

  go_main->sum_numbers_v3(
    EXPORTING
      iv_num1 = p_num1
      iv_num2 = p_num2
    RECEIVING
      rv_sum  = gv_sum
  ).

  WRITE: / 'Toplam V3 = ',gv_sum.

  gv_sum = go_main->sum_numbers_v3(
            iv_num1 = p_num1
            iv_num2 = p_num2
  ).
   WRITE: / 'Toplam V3 = ',gv_sum.
