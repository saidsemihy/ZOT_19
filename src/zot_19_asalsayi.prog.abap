*&---------------------------------------------------------------------*
*& Report zot_19_asalsayi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_asalsayi.

PARAMETERS: p_val1 TYPE i,
            p_val2 TYPE i.


DATA lv_temp TYPE i.
DATA lv_isasal TYPE bool.

lv_temp = 2.

WHILE p_val2 > p_val1.

  WHILE p_val1 NE lv_temp.
    IF p_val1 MOD lv_temp EQ 0.
      lv_isasal = 'F'.
    ENDIF.
    lv_temp = lv_temp + 1.


  ENDWHILE.

IF lv_isasal EQ 'T'.
      WRITE p_val1.
    ENDIF.
    p_val1 = p_val1 + 1.
    lv_isasal = 'T'.
lv_temp = 2.
ENDWHILE.
