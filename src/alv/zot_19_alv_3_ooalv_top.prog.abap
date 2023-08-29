*&---------------------------------------------------------------------*
*& Include          ZOT_19_ALV_3_OOALV_TOP
*&---------------------------------------------------------------------*

data: go_alv type ref to cl_gui_alv_grid,
      go_const type ref to cl_gui_custom_container.

data: gt_scarr type table of scarr,
      gt_fcat type lvc_t_fcat,
      gs_fcat type lvc_s_fcat,
      gs_layout type lvc_s_layo.
