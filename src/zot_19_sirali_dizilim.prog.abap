*&---------------------------------------------------------------------*
*& Report zot_19_sirali_dizilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_sirali_dizilim.

PARAMETERS: p_val1 TYPE i,
            p_val2 TYPE i.

DATA: p_say1 TYPE i,
      p_say2 TYPE i.

p_say1 = 1.
p_say2 = 2.

WRITE p_say1.
DO p_val1 - 1 TIMES.

if sy-index mod p_val2 eq 0.
  WRITE /.
endif.


p_say1 = p_say1 + 1.
WRITE p_say1.

ENDDO.
