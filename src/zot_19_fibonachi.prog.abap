*&---------------------------------------------------------------------*
*& Report zot_19_fibonachi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_fibonachi.

PARAMETERS: p_val1 TYPE i,
            p_val2 TYPE i.

DATA: p_say1 TYPE i,
      p_say2 TYPE i,
      p_temp TYPE i,
      p_syc  TYPE i,
      p_fib  TYPE string.

p_temp = 0.

p_say1 = 1.
p_say2 = 2.
p_syc = 1.

WRITE | { p_say1 }|.
WRITE | { p_say2 }|.

data lv_index type i.
lv_index = 1.

WHILE p_syc < p_val1.

  lv_index = lv_index + 1.

  p_syc = p_say1 + p_say2.
  p_say1 = p_say2.
  p_say2 = p_syc.


  IF lv_index MOD p_val2 = 0.
  WRITE /.
  ENDIF.

    if p_val1 > p_syc.
      WRITE | { p_say2 }|.
    endif.

ENDWHILE.
