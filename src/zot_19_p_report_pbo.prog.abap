*&---------------------------------------------------------------------*
*& Include          ZOT_19_P_REPORT_PBO
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module report pbo OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
 SET PF-STATUS '0100'.

 CONCATENATE sy-repid sy-uname sy-cdate sy-uzeit INTO gv_title SEPARATED BY space.

 SET TITLEBAR '0100'.

 PERFORM display_alv.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*