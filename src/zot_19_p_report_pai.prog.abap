*&---------------------------------------------------------------------*
*& Include          ZOT_19_P_REPORT_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
CASE sy-ucomm.
  WHEN '&BCK'.

    SET SCREEN 0.


ENDCASE.
ENDMODULE.
