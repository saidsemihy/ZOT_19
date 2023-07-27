*&---------------------------------------------------------------------*
*& Report zot_19_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_1 TYPE char6,
              p_2 TYPE char6,
              p_3 TYPE char6,
              p_4 TYPE char6,
              p_5 TYPE char6.
SELECTION-SCREEN END OF BLOCK a1.
TYPES: BEGIN OF lty_harfler,
         harf TYPE char1,
       END OF lty_harfler.
DATA : ls_p1 TYPE lty_harfler.
DATA: ls_p2 TYPE lty_harfler.
DATA: ls_p3 TYPE lty_harfler.
DATA: ls_p4 TYPE lty_harfler.
DATA: ls_p5 TYPE lty_harfler.
DATA: ls_p6 TYPE lty_harfler.
DATA : lt_p1 TYPE TABLE OF lty_harfler.
DATA : lt_p2 TYPE TABLE OF lty_harfler.
DATA : lt_p3 TYPE TABLE OF lty_harfler.
DATA : lt_p4 TYPE TABLE OF lty_harfler.
DATA : lt_p5 TYPE TABLE OF lty_harfler.
DATA : lt_p6 TYPE TABLE OF lty_harfler.
DATA: pos1 TYPE i.
DATA: v_char1.
DATA: sayac.


DO 5 TIMES.
  v_char1 = p_1+pos1(1).
  ls_p1-harf = v_char1.
  APPEND ls_p1 TO lt_p1.
  pos1 += 1.
ENDDO.
pos1 = 0.
SORT lt_p1 ASCENDING BY harf.

DO 5 TIMES.
  v_char1 = p_2+pos1(1).
  ls_p1-harf = v_char1.
  APPEND ls_p1 TO lt_p2.
  pos1 += 1.
ENDDO.
pos1 = 0.
SORT lt_p2 ASCENDING BY harf.

DO 5 TIMES.
  v_char1 = p_3+pos1(1).
  ls_p1-harf = v_char1.
  APPEND ls_p1 TO lt_p3.
  pos1 += 1.
ENDDO.
pos1 = 0.
SORT lt_p3 ASCENDING BY harf.

DO 5 TIMES.
  v_char1 = p_4+pos1(1).
  ls_p1-harf = v_char1.
  APPEND ls_p1 TO lt_p4.
  pos1 += 1.
ENDDO.
pos1 = 0.
SORT lt_p4 ASCENDING BY harf.

DO 5 TIMES.
  v_char1 = p_5+pos1(1).
  ls_p1-harf = v_char1.
  APPEND ls_p1 TO lt_p5.
  pos1 += 1.
ENDDO.
pos1 = 0.
SORT lt_p5 ASCENDING BY harf.




DATA: lv_data TYPE string.
sayac = 0.

LOOP AT lt_p1 INTO ls_p1.
  LOOP AT lt_p2 INTO ls_p2.
    IF ls_p1-harf EQ ls_p2-harf.
      sayac = sayac + 1.

    ENDIF.
    IF sayac EQ 5.
      cl_demo_output=>write( lt_p1 ).
      cl_demo_output=>write( 'Aynı' ).
      cl_demo_output=>write( lt_p2 ).
      cl_demo_output=>display(  ).
      EXIT.
    ENDIF.
  ENDLOOP.
ENDLOOP.



*
*LOOP AT lt_p1 INTO ls_p1.
*  READ TABLE lt_p2 INTO ls_p2 WITH KEY harf = ls_p2.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p1 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p2 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p1 INTO ls_p1.
*  READ TABLE lt_p3 INTO ls_p3 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p1 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p3 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p1 INTO ls_p1.
*  READ TABLE lt_p4 INTO ls_p4 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p1 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p4 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p1 INTO ls_p1.
*  READ TABLE lt_p5 INTO ls_p5 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p1 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p5 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*
*LOOP AT lt_p2 INTO ls_p1.
*  READ TABLE lt_p3 INTO ls_p3 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p2 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p3 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p2 INTO ls_p1.
*  READ TABLE lt_p4 INTO ls_p4 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p2 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p4 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p2 INTO ls_p1.
*  READ TABLE lt_p5 INTO ls_p5 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p2 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p5 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*
*
*LOOP AT lt_p3 INTO ls_p1.
*  READ TABLE lt_p4 INTO ls_p4 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p3 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p4 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p3 INTO ls_p1.
*  READ TABLE lt_p5 INTO ls_p5 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p3 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p5 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
*
*LOOP AT lt_p4 INTO ls_p1.
*  READ TABLE lt_p5 INTO ls_p5 WITH KEY harf = ls_p1-harf.
*  IF sy-subrc EQ 0.
*    sayac = sayac + 1.
*    IF sayac EQ 5.
*
*      cl_demo_output=>write( lt_p4 ).
*      cl_demo_output=>write( 'Aynı' ).
*      cl_demo_output=>write( lt_p5 ).
*      cl_demo_output=>display(  ).
*      EXIT.
*    ENDIF.
*  ENDIF.
*ENDLOOP.
*sayac = 0.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*do 5 times.
*if sy-index eq 1.
*  lt_p1 = lt_p1.
*endif.
*
*if sy-index eq 2.
*  lt_p1 = lt_p2.
*endif.
*
*if sy-index eq 3.
*  lt_p1 = lt_p3.
*endif.
*
*if sy-index eq 4.
*  lt_p1 = lt_p4.
*endif.
*
*if sy-index eq 5.
*  lt_p1 = lt_p5.
*endif.
*
*
*
*
*
*

*READ TABLE lt_p3 INTO ls_p1 WITH KEY harf = ls_p1-harf.
*if sy-subrc eq 0.
*  sayac = sayac + 1.
*  if sayac eq 5.
*    cl_demo_output=>write( lt_p1 ).
*    cl_demo_output=>write( 'Aynı' ).
*    cl_demo_output=>write( lt_p3 ).
*    cl_demo_output=>display(  ).
*
*    exit.
*  endif.
*endif.
*READ TABLE lt_p4 INTO ls_p1 WITH KEY harf = ls_p1-harf.
*if sy-subrc eq 0.
*  sayac = sayac + 1.
*  if sayac eq 5.
*    cl_demo_output=>write( lt_p1 ).
*    cl_demo_output=>write( 'Aynı' ).
*    cl_demo_output=>write( lt_p4 ).
*    cl_demo_output=>display(  ).
*
*    exit.
*  endif.
*endif.
*READ TABLE lt_p5 INTO ls_p1 WITH KEY harf = ls_p1-harf.
*if sy-subrc eq 0.
*  sayac = sayac + 1.
*  if sayac eq 5.
*    cl_demo_output=>write( lt_p1 ).
*    cl_demo_output=>write( 'Aynı' ).
*    cl_demo_output=>write( lt_p5 ).
*    cl_demo_output=>display(  ).
*
*    exit.
*  endif.
*endif.
*
*ENDLOOP.
*
*
*
*
*ENDDO.
*
















*DATA : text(50) VALUE 'TEST STRING',
*
*
*       pos1     TYPE i,
*       pos2     TYPE i,
*       pos3     TYPE i,
*       pos4     TYPE i,
*       pos5     TYPE i,
*       pos6     TYPE i,
*       sayac    TYPE i,
*       v_char1,
*       v_char2,
*       v_char3,
*       v_char4,
*       v_char5,
*       v_char6.
*
*
*DO 6 TIMES.
*  v_char1 = p_1+pos1(1).
*  DO 6 TIMES.
*    v_char2 = p_2+pos2(1).
*    IF v_char2 EQ v_char1.
*      sayac = sayac + 1.
*      EXIT.
*    ENDIF.
*    pos2 += 1.
*  ENDDO.
*  IF sayac EQ 6.
*    cl_demo_output=>write(  |{ p_1 } - { p_2 }|  ).
*    cl_demo_output=>display(  ).
*  ENDIF.
*
*  pos1 += 1.
*  pos2 = 0.
*ENDDO.
*sayac = 0.
*
*
*DO 6 TIMES.
*  v_char1 = p_1+pos1(1).
*  DO 6 TIMES.
*    v_char3 = p_3+pos3(1).
*    IF v_char3 EQ v_char1.
*      sayac = sayac + 1.
*      EXIT.
*    ENDIF.
*    pos3 += 1.
*  ENDDO.
*  IF sayac EQ 6.
*    cl_demo_output=>write(  |{ p_1 } - { p_3 }|  ).
*    cl_demo_output=>display(  ).
*  ENDIF.
*
*  pos1 += 1.
*  pos3 = 0.
*ENDDO.
*sayac = 0.
*
*
*
*
*
**
**DO 6 TIMES.
**
**  IF sy-index EQ 1.
**    v_char1 = p_1+pos1(1).
**  ELSEIF sy-index EQ 2.
**    v_char2 = p_2+pos2(1).
**  ELSEIF sy-index EQ 3.
**    v_char3 = p_3+pos3(1).
**  ELSEIF sy-index EQ 4.
**    v_char4 = p_4+pos4(1).
**  ELSEIF sy-index EQ 5.
**    v_char5 = p_5+pos5(1).
**  ENDIF.
**
**
**  DO 6 TIMES.
**    v_char2 = p_2+pos2(1).
**    IF v_char2 EQ v_char1.
**      sayac = sayac + 1.
**    ENDIF.
**    pos2 += 1.
**  ENDDO.
**  IF sayac EQ 6.
**    WRITE: | { p_1 } - { p_2 }|.
**  ENDIF.
**  sayac = 0.
**  pos2 = 0.
**
**
**
**  DO 6 TIMES.
**    v_char3 = p_3+pos3(1).
**    IF v_char3 EQ v_char1.
**      sayac = sayac + 1.
**    ENDIF.
**    pos3 += 1.
**  ENDDO.
**  IF sayac EQ 6.
**    WRITE: | { p_1 } - { p_3 }|.
**  ENDIF.
**  sayac = 0.
**  pos3 = 0.
**
**  DO 6 TIMES.
**    v_char4 = p_4+pos4(1).
**    IF v_char4 EQ v_char1.
**      sayac = sayac + 1.
**    ENDIF.
**    pos4 += 1.
**  ENDDO.
**  IF sayac EQ 6.
**    WRITE: | { p_1 } - { p_4 }|.
**  ENDIF.
**  sayac = 0.
**  pos4 = 0.
**
**  DO 6 TIMES.
**    v_char5 = p_5+pos5(1).
**    IF v_char5 EQ v_char1.
**      sayac = sayac + 1.
**    ENDIF.
**    pos5 += 1.
**  ENDDO.
**  IF sayac EQ 6.
**    WRITE: | { p_1 } - { p_5 }|.
**  ENDIF.
**  sayac = 0.
**  pos5 = 0.
**
**
**
**
**
**
**  pos1 = pos1 + 1.
**ENDDO.
**cl_demo_output=>write(  |{ p_1 } - { p_2 }|  ).
**cl_demo_output=>display(  ).
