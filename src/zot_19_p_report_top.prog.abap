*&---------------------------------------------------------------------*
*& Include          ZOT_19_P_REPORT_TOP
*&---------------------------------------------------------------------*

TABLES: ekpo, eban, ekko.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_banfn FOR eban-banfn MODIF ID sc1,
                  s_bnfpo FOR eban-bnfpo MODIF ID sc1.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  SELECT-OPTIONS: s_ebeln FOR ekko-ebeln MODIF ID sc2,
                  s_matkl FOR ekpo-matkl MODIF ID sc2.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.
  PARAMETERS: p_sat RADIOBUTTON GROUP g1 USER-COMMAND cmd_rd DEFAULT 'X',
              p_sas RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b3.

DATA: go_custom TYPE REF TO cl_gui_custom_container,
      go_grid   TYPE REF TO cl_gui_alv_grid,
      gt_eban   TYPE TABLE OF zot_19_s_eban,
      gs_eban   TYPE zot_19_s_eban,
      gt_ekpo   TYPE TABLE OF zot_19_s_ekpo,
      gs_ekpo   TYPE zot_19_s_ekpo,
      gt_fcat   TYPE lvc_t_fcat,
      gs_fcat   TYPE lvc_s_fcat,
      gs_layout TYPE lvc_s_layo,
      gv_title  TYPE char50.




FIELD-SYMBOLS: <gfs_eban> TYPE zot_19_s_eban,
               <gfs_ekpo> TYPE zot_19_s_ekpo.


AT SELECTION-SCREEN OUTPUT.
* Toggle the selection screens based on radio buttons
  LOOP AT SCREEN.
    IF p_sas = 'X' AND screen-group1 = 'SC1'.
      PERFORM delete_select_options.
      screen-active = 0.
      MODIFY SCREEN.
    ELSEIF p_sat = 'X' AND screen-group1 = 'SC2'.
      PERFORM delete_select_options.
      screen-active = 0.
      MODIFY SCREEN.

    ENDIF.
  ENDLOOP.

FORM delete_select_options.
  REFRESH s_banfn.
  REFRESH s_bnfpo.
  REFRESH s_ebeln.
  REFRESH s_matkl.
ENDFORM.
