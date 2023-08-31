*&---------------------------------------------------------------------*
*& Report zot_19_o_oop_4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_o_oop_4.

CLASS lcl_main DEFINITION DEFERRED.

DATA: go_main1 TYPE REF TO lcl_main,
      go_main2 TYPE REF TO lcl_main,
      go_main3 TYPE REF TO lcl_main.

CLASS lcl_main DEFINITION.
  PUBLIC SECTION.
    METHODS:
      constructor,
      do_process IMPORTING iv_pers_id   TYPE char10
                           iv_pers_name TYPE char20
                           iv_pers_age  TYPE numc2.

    CLASS-METHODS: "İlk referan alan objeyi create ettiğimizde 1 kere çalışıyor.
      class_constructor, "class_contructor da constructor gibi sabit öyle yazmamız gerekiyor
      inc_num.

    DATA: mv_pers_id   TYPE char10,
          mv_pers_name TYPE char10.

    CLASS-DATA: mv_pers_age TYPE numc2, "Statik değişlen düm oluşturulan objelerde aynı olur
                mv_tt1_num  TYPE i,
                mv_tt1_num2 TYPE i.

ENDCLASS.


CLASS lcl_main IMPLEMENTATION.
  METHOD constructor.


  ENDMETHOD.

  METHOD class_constructor.
    mv_tt1_num = mv_tt1_num + 1.
  ENDMETHOD.

  METHOD inc_num.
    mv_tt1_num2 = mv_tt1_num2 + 1.
  ENDMETHOD.



  METHOD do_process.
    mv_pers_id = iv_pers_id.
    mv_pers_name = iv_pers_name.
    mv_pers_age = iv_pers_age.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  CREATE OBJECT: go_main1,
                 go_main2,
                 go_main3.

  go_main1->do_process(
    EXPORTING
      iv_pers_id   = '1000000001'
      iv_pers_name = 'Said Semih'
      iv_pers_age  = '22'
  ).

  go_main2->do_process(
  EXPORTING
    iv_pers_id   = '1000000002'
    iv_pers_name = 'Tarık Tekin'
    iv_pers_age  = '27'
).

  go_main3->do_process(
  EXPORTING
    iv_pers_id   = '1000000003'
    iv_pers_name = 'Melikşah Bilir'
    iv_pers_age  = '26'
).


  WRITE: / go_main1->mv_pers_id, go_main1->mv_pers_name, go_main1->mv_pers_age.
  WRITE: / go_main2->mv_pers_id, go_main2->mv_pers_name, go_main2->mv_pers_age.
  WRITE: / go_main3->mv_pers_id, go_main3->mv_pers_name, go_main3->mv_pers_age.

  WRITE: / 'Total Num = ', go_main1->mv_tt1_num.
  WRITE: / 'Total Num = ', go_main2->mv_tt1_num.
  WRITE: / 'Total Num = ', go_main3->mv_tt1_num.

  go_main1->inc_num( ).
  go_main1->inc_num( ).
  go_main2->inc_num( ).
  go_main2->inc_num( ).
  go_main2->inc_num( ).
  go_main3->inc_num( ).


  WRITE: / 'Total Num2 = ', go_main1->mv_tt1_num2.
  WRITE: / 'Total Num2 = ', go_main2->mv_tt1_num2.
  WRITE: / 'Total Num2 = ', go_main3->mv_tt1_num2.
