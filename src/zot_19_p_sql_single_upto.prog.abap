*&---------------------------------------------------------------------*
*& Report zot_19_p_sql_single_upto
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_sql_single_upto.

DATA: gt_scarr    TYPE TABLE OF scarr,
      gs_scarr    TYPE scarr,
      gv_currcode TYPE s_currcode.


START-OF-SELECTION.

  SELECT * FROM scarr
      INTO TABLE gt_scarr
      WHERE carrid EQ 'AC'.

  READ TABLE gt_scarr INTO gs_scarr INDEX 1.

  WRITE: gs_scarr-currcode.


  SELECT * UP TO 1 ROWS FROM scarr
  INTO TABLE gt_scarr
  WHERE carrid EQ 'AC'.

  READ TABLE gt_scarr INTO gs_scarr INDEX 1.

  WRITE: gs_scarr-currcode.

  SELECT SINGLE * FROM scarr
    INTO gs_scarr
    WHERE carrid EQ 'AC'.
  WRITE: gs_scarr-currcode.

  SELECT SINGLE currcode FROM scarr
    INTO gv_currcode
    WHERE carrid EQ 'AC'.

  WRITE: gv_currcode.
