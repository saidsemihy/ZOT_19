*&---------------------------------------------------------------------*
*& Report ZOT_19_ALV_3_OOALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_19_ALV_3_OOALV.

INCLUDE zot_19_alv_3_ooalv_top.
INCLUDE zot_19_alv_3_ooalv_pbo.
INCLUDE zot_19_alv_3_ooalv_pai.
INCLUDE zot_19_alv_3_ooalv_frm.

START-OF-SELECTION.

perform get_data.
perform set_fcat.
perform set_layout.




call SCREEN 0100.
