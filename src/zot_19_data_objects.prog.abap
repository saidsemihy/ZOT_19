*&---------------------------------------------------------------------*
*& Report zot_19_data_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_data_objects.

*BREAK point.
*
*DATA: gv_ogrenci_adi(12) TYPE c,            "predefined
*      gv_ogrenci_soyadi  TYPE char12,    "data element
*      gv_tarih           TYPE sy-datum.
*
*gv_ogrenci_adi = 'Said Semih'.
*gv_ogrenci_soyadi = 'Yalcin'.
*gv_tarih = sy-datum.
*
*cl_demo_output=>write( gv_ogrenci_adi ).
*cl_demo_output=>write( gv_ogrenci_soyadi ).
*cl_demo_output=>write( gv_tarih ).
*
*
*cl_demo_output=>write( | Öğrencinin adı: { gv_ogrenci_adi },  Öğrencinin soyadı: { gv_ogrenci_soyadi } tarih: { gv_tarih }| ).
*
*TYPES: gty_char TYPE c LENGTH 50.
*
*DATA: gv_new TYPE gty_char.
*
*"if
*DATA:gv_langu TYPE sy-langu.
*gv_langu = sy-langu.
*
*
*IF gv_langu = 'T'.
*  cl_demo_output=>write( |Merhaba Dünya TR| ).
*ELSEIF gv_langu EQ 'E'.
*  cl_demo_output=>write( |Hello World EN| ).
*ELSE.
*  cl_demo_output=>write( |Başka Dil FR| ).
*ENDIF.
*
*
*"case
*CASE gv_langu.
*  WHEN 'E'.
*    cl_demo_output=>write( |Hello World EN| ).
*  WHEN 'T'.
*    cl_demo_output=>write( |Merhaba Dünya TR| ).
*  WHEN OTHERS.
*    cl_demo_output=>write( |Başka Dil Biliyorum| ).
*ENDCASE.
*
*
*"do
*DATA: gv_text1 TYPE char12.
*gv_text1 = 'Hello World'.
*DATA(gv_text2) = 'Hello World'.
*DATA(gv_bugun) = sy-datum.
*gv_text2 = 'Hello World'.
*
*data(lv_num) = strlen( gv_text2 ).
*
*do lv_num times.
*cl_demo_output=>write( |Hello World EN| ).
*ENDDO.
*
*



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA: lv_number1 TYPE i VALUE 10,
*      lv_number2 TYPE i VALUE 5.
*
*
*
*data(lv_toplama) = lv_number1 + lv_number2.
*data(lv_cikarma) = lv_number1 - lv_number2.
*data(lv_carpma) = lv_number1 * lv_number2.
*data(lv_bolme) = lv_number1 / lv_number2.
*
*
*
*cl_demo_output=>write( |{ lv_number1 } + { lv_number2 } = { lv_toplama }| ).
*cl_demo_output=>write( |{ lv_number1 } - { lv_number2 } = { lv_cikarma }| ).
*cl_demo_output=>write( |{ lv_number1 } * { lv_number2 } = { lv_carpma }| ).
*cl_demo_output=>write( |{ lv_number1 } / { lv_number2 } = { lv_bolme }| ).
*
*cl_demo_output=>write( |Clear işleminden önce lv_bolme değeri: { lv_bolme }| ).
*clear lv_bolme.
*cl_demo_output=>write( |Clear işleminden sonra lv_bolme değeri: { lv_bolme }| ).
*
*
*lv_number2 = 0.
*
*try.
*  lv_bolme = lv_number1 / lv_number2.
*  catch cx_sy_zerodivide.
*  cl_demo_output=>write( |Sıfıra bölme işlemi| ).
*  catch cx_sy_arithmetic_overflow.
*  cl_demo_output=>write( |Aritmetik overflow| ).
*endtry.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA: lv_number1 TYPE i VALUE 10,
      lv_number2 TYPE i VALUE 5,
      lv_op      TYPE c VALUE '*'.
*      lv_result  TYPE i.
*
*CALL FUNCTION 'ZOT_00_DO_MATH_OPS'
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = lv_result.
**  EXCEPTIONS
**    cx_sy_zerodivide = 1.
**    cx_sy_assign_cast_error.
*
*cl_demo_output=>write( |{ lv_number1 } * { lv_number2 } = { lv_result }| ).
*cl_demo_output=>display(  ).
*WRITE | lv_result = { lv_result } |.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*data(lo_math_op) = new zcl_ot_19_mat_ops(  ).
*
*lo_math_op->calculate_result(
*  EXPORTING
*    iv_number1   = lv_number1
*    iv_number2   = lv_number2
*    iv_operation = lv_op
*  IMPORTING
*    ev_result    = DATA(lv_result)
*).
*
*cl_demo_output=>write( |{ lv_number1 } { lv_op } { lv_number2 } = { lv_result }| ).
*cl_demo_output=>display(  ).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*TYPES: gty_tip TYPE c LENGTH 12.
*
*TYPES: BEGIN OF gty_komplex,
*         alan1 TYPE c LENGTH 10,
*         alan2 TYPE c LENGTH 12,
*         alan3 TYPE i,
*       END OF gty_komplex.
*
*TYPES: BEGIN OF gty_student,
*         name  TYPE c LENGTH 10,
*         age   TYPE i,
*         id    TYPE c LENGTH 10,
*         bolum TYPE c LENGTH 20,
*       END OF gty_student.
*
*DATA: gv_alan1   TYPE gty_tip,
*      gs_komplex TYPE gty_komplex,
*      gv_alan2   TYPE gty_komplex-alan2,
*      gt_komplex TYPE TABLE OF gty_komplex.
*
*gv_alan1 = 'Hello World'.
*
*gs_komplex-alan1 = 'One'.
*gs_komplex-alan2 = 'Talent'.
*gs_komplex-alan3 = 23.
*
*
*"gt_komplex = value #( (  ),(  ),(  )  )
*
*gt_komplex = VALUE #( ( alan1 = 'Ahmet'
*                        alan2 = 'Yalçın'
*                        alan3 = 01 )
*
*                        ( alan1 = 'alper'
*                        alan2 = 'birinci'
*                        alan3 = 02 )
*
*                        ( alan1 = 'kamil'
*                        alan2 = 'koç'
*                        alan3 = 03 )
*
*                         ).
*APPEND VALUE #( alan1 = 'Atalay'
*                alan2 = 'Şendur'
*                alan3 = 04 ) TO gt_komplex.
*
*APPEND VALUE #( alan1 = 'Berkay'
*                alan2 = 'Alışkan'
*                alan3 = 05 ) TO gt_komplex.
*
*append gs_komplex to gt_komplex.
*
*clear gs_komplex.
*
*gs_komplex-alan1 = 'Eyyüp'.
*gs_komplex-alan2 = 'Kaya'.
*gs_komplex-alan3 = '06'.
*append gs_komplex to gt_komplex.
*
*clear gs_komplex.
*
*gs_komplex = VALUE #( alan1 = 'Eren' alan2 = 'kara' alan3 = 07 ).
*append gs_komplex to gt_komplex.
*
*cl_demo_output=>write( gt_komplex ).
*cl_demo_output=>display(  ).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
*
*  PARAMETERS: p_val1 TYPE p DECIMALS 3 OBLIGATORY,
*              p_val2 TYPE p DECIMALS 3 OBLIGATORY.
*
*SELECTION-SCREEN END OF BLOCK b1.
*
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
*
*  PARAMETERS :
*    p_topla  RADIOBUTTON GROUP g1,
*    p_cikart RADIOBUTTON GROUP g1,
*    p_carp   RADIOBUTTON GROUP g1,
*    p_bol    RADIOBUTTON GROUP g1.
*
*SELECTION-SCREEN END OF BLOCK b2.
*DATA gv_sonuc TYPE p DECIMALS 3.
*
*START-OF-SELECTION.
*
*  IF p_topla = abap_true.
*    gv_sonuc = p_val1 + p_val2.
*  ELSEIF p_cikart = abap_true.
*    gv_sonuc = p_val1 - p_val2.
*  ELSEIF p_carp = abap_true.
*    gv_Sonuc = p_val1 * p_val2.
*  ELSEIF p_bol = abap_true.
*    TRY.
*        gv_sonuc = p_val1 / p_val2.
*      CATCH cx_sy_zerodivide.
*        MESSAGE 'Sıfıra Bölünmez' TYPE 'I'.
*    ENDTRY.
*  ENDIF.
*
*
*  MESSAGE | Sonuc = { gv_sonuc } | TYPE 'I'.
*
*
*
*
*  cl_demo_output=>display(  ).
