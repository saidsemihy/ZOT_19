*&---------------------------------------------------------------------*
*& Report zot_19_p_internal
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_internal.

DATA: lt_table TYPE TABLE OF zot_00_t_materia.
DATA: ls_table TYPE zot_00_t_materia.
DATA: lt_table_new TYPE TABLE OF zot_00_t_materia.
DATA: ls_table_new TYPE zot_00_t_materia.


START-OF-SELECTION.

  SELECT *
        INTO TABLE lt_table
        FROM zot_00_t_materia.

  READ TABLE lt_table INTO ls_table WITH KEY matnr = '000000000000000001'.
  IF sy-subrc EQ 0.
    lt_table = VALUE #( BASE lt_table (
                        matnr = '99'
                        maktx = 'Kalem'
                        matkl = 'Kırtasiye'
                        menge = ls_table-menge
                        meins = ls_table-meins ) ).

  ENDIF.
  BREAK-POINT.
