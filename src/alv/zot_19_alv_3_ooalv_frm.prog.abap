*&---------------------------------------------------------------------*
*& Include          ZOT_19_ALV_3_OOALV_FRM
*&---------------------------------------------------------------------*

FORM  display_alv.
  CREATE OBJECT go_const
    EXPORTING
      container_name = 'CC_ALV'.

  CREATE OBJECT go_alv
    EXPORTING
      i_parent = go_const.

  CALL METHOD go_alv->set_table_for_first_display
    EXPORTING
*     i_buffer_active =
*     i_bypassing_buffer            =
*     i_consistency_check           =
*     i_structure_name              = 'SCARR'
*     is_variant      =
*     i_save          =
*     i_default       = 'X'
      is_layout       = gs_layout
*     is_print        =
*     it_special_groups             =
*     it_toolbar_excluding          =
*     it_hyperlink    =
*     it_alv_graphics =
*     it_except_qinfo =
*     ir_salv_adapter =
    CHANGING
      it_outtab       = gt_scarr
      it_fieldcatalog = gt_fcat
*     it_sort         =
*     it_filter       =
*    EXCEPTIONS
*     invalid_parameter_combination = 1
*     program_error   = 2
*     too_many_lines  = 3
*     others          = 4
    .
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*     WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
  SELECT * FROM scarr
    INTO TABLE gt_scarr.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_fcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_fcat .
  CLEAR gs_fcat.
  gs_fcat-fieldname = 'CARRID'.
  gs_fcat-scrtext_s = 'Havayolu T.'.
  gs_fcat-scrtext_m = 'Havayolu Tanımı'.
  gs_fcat-scrtext_l = 'Havayolu Şirketinin kısa tanımı'.
*  gs_fcat-key = abap_true.
*gs_fcat-col_pos = 2.
  APPEND gs_fcat TO gt_fcat.

  CLEAR gs_fcat.
  gs_fcat-fieldname = 'CARRNAME'.
  gs_fcat-scrtext_s = 'Havayolu Ad'.
  gs_fcat-scrtext_m = 'Havayolu Adı'.
  gs_fcat-scrtext_l = 'Havayolu Şirketinin Adı'.
*gs_fcat-col_pos = 3.
  APPEND gs_fcat TO gt_fcat.

  CLEAR gs_fcat.
  gs_fcat-fieldname = 'CURRCODE'.
  gs_fcat-scrtext_s = 'Havayolu PB'.
  gs_fcat-scrtext_m = 'Havayolu PB'.
  gs_fcat-scrtext_l = 'Havayolu Şirketinin ulusal para birimi'.
*gs_fcat-col_pos = 4.
  APPEND gs_fcat TO gt_fcat.

  CLEAR gs_fcat.
  gs_fcat-fieldname = 'URL'.
  gs_fcat-scrtext_s = 'Havayolu URL'.
  gs_fcat-scrtext_m = 'Havayolu URL'.
  gs_fcat-scrtext_l = 'Havayolu Şirketinin Url'.
*gs_fcat-col_pos = 1.
*gs_fcat-col_opt = abap_true.

**gs_fcat-ref_table = 'SCARR'.
**gs_fcat-ref_field = 'URL'.
  APPEND gs_fcat TO gt_fcat.



ENDFORM.
*&---------------------------------------------------------------------*
*& Form set_layout
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM set_layout .
clear: gs_layout.
gs_layout-cwidth_opt = abap_true.
*gs_layout-edit = abap_true.
*gs_layout-no_toolbar = abap_true.
gs_layout-zebra = abap_true.
ENDFORM.
