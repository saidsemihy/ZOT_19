*&---------------------------------------------------------------------*
*& Report zot_19_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE i OBLIGATORY,
              p_val2 TYPE i OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_topla  RADIOBUTTON GROUP g1,
    p_cikart RADIOBUTTON GROUP g1,
    p_carp   RADIOBUTTON GROUP g1,
    p_bol    RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.
DATA gv_sonuc TYPE p DECIMALS 3.
DATA gv_istrue TYPE c VALUE 'T'.


START-OF-SELECTION.

  IF p_topla = abap_true.
    gv_sonuc = p_val1 + p_val2.
  ELSEIF p_cikart = abap_true.
    gv_sonuc = p_val1 - p_val2.
  ELSEIF p_carp = abap_true.
    gv_Sonuc = p_val1 * p_val2.
  ELSEIF p_bol = abap_true.
    IF p_val1 EQ 0 AND p_val2 EQ 0.
      gv_istrue = 'F'.
      MESSAGE 'Tanımsız Değer' TYPE 'I'.
    ELSEIF p_val2 EQ 0.
      gv_istrue = 'F'.
      MESSAGE 'Sıfıra bölünmez' TYPE 'I'.
    ELSE.
      gv_istrue = 'T'.
      gv_Sonuc = p_val1 / p_val2.
    ENDIF.
  ENDIF.


  IF gv_istrue EQ 'T'.
    MESSAGE | Sonuc = { gv_sonuc } | TYPE 'I'.
  ENDIF.
