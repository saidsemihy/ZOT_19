*&---------------------------------------------------------------------*
*& Report zot_19_p_alv_reuse
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_alv_reuse.

TYPES: BEGIN OF gty_list,
         ebeln TYPE ebeln,
         ebelp TYPE ebelp,
         bstyp TYPE ebstyp,
         bsart TYPE esart,
         matnr TYPE matnr,
         menge TYPE bstmg,
       END OF gty_list.

DATA: gt_list TYPE TABLE OF gty_list.
DATA: gs_list TYPE gty_list.

DATA: gt_fieldcatalog TYPE slis_t_fieldcat_alv.
DATA: gs_fieldcatalog TYPE slis_fieldcat_alv.

data: gs_layout type slis_layout_alv.

START-OF-SELECTION.


  SELECT ekpo~ebeln
         ekpo~ebelp
         ekko~bstyp
         ekko~bsart
         ekpo~matnr
         ekpo~menge
   FROM ekko
     INNER JOIN ekpo ON ekko~ebeln = ekpo~ebeln
     INTO TABLE gt_list.

*  gs_fieldcatalog-fieldname = 'Ebeln'.
*  gs_fieldcatalog-seltext_s = 'Sas no'.
*  gs_fieldcatalog-seltext_m = 'Sas Numarası'.
*  gs_fieldcatalog-seltext_l = 'Sas Numarası'.
*  gs_fieldcatalog-key = abap_true.
*  gs_fieldcatalog-col_pos = 0.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.
*
*
*  CLEAR gs_fieldcatalog.
*  gs_fieldcatalog-fieldname = 'ebelp'.
*  gs_fieldcatalog-seltext_s = 'Kalem'.
*  gs_fieldcatalog-seltext_m = 'Kalem'.
*  gs_fieldcatalog-seltext_l = 'Kalem'.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.
*
*
*  CLEAR gs_fieldcatalog.
*  gs_fieldcatalog-fieldname = 'bstyp'.
*  gs_fieldcatalog-seltext_s = 'Belge Tipi'.
*  gs_fieldcatalog-seltext_m = 'Belge Tipi'.
*  gs_fieldcatalog-seltext_l = 'Belge Tipi'.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.
*
*  CLEAR gs_fieldcatalog.
*  gs_fieldcatalog-fieldname = 'bsart'.
*  gs_fieldcatalog-seltext_s = 'Belge Türü'.
*  gs_fieldcatalog-seltext_m = 'Belge Türü'.
*  gs_fieldcatalog-seltext_l = 'Belge Türü'.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.
*
*
*  CLEAR gs_fieldcatalog.
*  gs_fieldcatalog-fieldname = 'matnr'.
*  gs_fieldcatalog-seltext_s = 'Malzeme'.
*  gs_fieldcatalog-seltext_m = 'Malzeme'.
*  gs_fieldcatalog-seltext_l = 'Malzeme'.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.
*
*
*  CLEAR gs_fieldcatalog.
*  gs_fieldcatalog-fieldname = 'menge'.
*  gs_fieldcatalog-seltext_s = 'Miktar'.
*  gs_fieldcatalog-seltext_m = 'Miktar'.
*  gs_fieldcatalog-seltext_l = 'Miktar'.
*  gs_fieldcatalog-do_sum =  abap_true.
*  APPEND gs_fieldcatalog TO gt_fieldcatalog.



  gs_layout-window_titlebar = 'REUSE ALV BUDUR'.
  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.
  gs_layout-edit = abap_true.


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
*     i_interface_check           = space
*     i_bypassing_buffer          = space
*     i_buffer_active             = space
*     i_callback_program          = space
*     i_callback_pf_status_set    = space
*     i_callback_user_command     = space
*     i_callback_top_of_page      = space
*     i_callback_html_top_of_page = space
*     i_callback_html_end_of_list = space
*     i_structure_name            =
*     i_background_id             =
*     i_grid_title                =
*     i_grid_settings             =
*     is_layout   =
     it_fieldcat = gt_fieldcatalog
*     it_excluding                =
*     it_special_groups           =
*     it_sort     =
*     it_filter   =
*     is_sel_hide =
*     i_default   = 'X'
*     i_save      = space
*     is_variant  =
*     it_events   =
*     it_event_exit               =
*     is_print    =
*     is_reprep_id                =
*     i_screen_start_column       = 0
*     i_screen_start_line         = 0
*     i_screen_end_column         = 0
*     i_screen_end_line           = 0
*     i_html_height_top           = 0
*     i_html_height_end           = 0
*     it_alv_graphics             =
*     it_hyperlink                =
*     it_add_fieldcat             =
*     it_except_qinfo             =
*     ir_salv_fullscreen_adapter  =
*     o_previous_sral_handler     =
*  IMPORTING
*     e_exit_caused_by_caller     =
*     es_exit_caused_by_user      =
    TABLES
      t_outtab    = gt_list
*  EXCEPTIONS
*     program_error               = 1
*     others      = 2
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
