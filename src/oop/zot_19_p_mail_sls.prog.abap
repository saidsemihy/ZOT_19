*&---------------------------------------------------------------------*
*& Include          ZOT_19_P_MAIL_SLS
*&---------------------------------------------------------------------*
TABLES: likp.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_teslim FOR likp-vbeln.
SELECTION-SCREEN END OF BLOCK a1.
