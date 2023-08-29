*&---------------------------------------------------------------------*
*& Report zssy_hello_world
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zssy_hello_world.

*WRITE 'Hello World'.
*
*cl_demo_output=>display( 'Hello World' ).
*cl_demo_output=>display( 'Merhaba Dünya' ).


*Table Declaration
TABLES : vbap.

*Type-Pools

TYPE-POOLS: slis.

*Type Declaration

TYPES: BEGIN OF ty_vbap,

         vbeln  TYPE vbap-vbeln,
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         matkl  TYPE vbap-matkl,
         arktx  TYPE vbap-arktx,
         netwr  TYPE vbap-netwr,
         waerk  TYPE vbap-waerk,
         klmeng TYPE vbap-klmeng,
         vrkme  TYPE vbap-vrkme,

       END OF ty_vbap.

*Data Declaration

DATA: gt_vbap   TYPE STANDARD TABLE OF ty_vbap,

      wa_vbap   TYPE ty_vbap,
      gt_fcat   TYPE slis_t_fieldcat_alv,
      wa_fcat   LIKE LINE OF gt_fcat,
      gt_layout TYPE slis_layout_alv.

*Selection Screen

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: so_vbeln FOR vbap-vbeln.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

*Data Fetching

  SELECT vbeln

  posnr
  matnr
  matkl
  arktx
  netwr
  waerk
  klmeng
  vrkme

  FROM vbap INTO TABLE gt_vbap
  WHERE vbeln IN so_vbeln.

*Field Catalog

  wa_fcat-col_pos = 1.
  wa_fcat-fieldname = 'vbeln'.
  wa_fcat-seltext_m = 'sd NO.'.
  wa_fcat-key = 'x'.
  wa_fcat-hotspot = 'x'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 2.
  wa_fcat-fieldname = 'posnr'.
  wa_fcat-seltext_m = 'item NO.'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 3.
  wa_fcat-fieldname = 'matnr'.
  wa_fcat-seltext_m = 'material NO.'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 4.
  wa_fcat-fieldname = 'matkl'.
  wa_fcat-seltext_m = 'material group'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 5.
  wa_fcat-fieldname = 'arktx'.
  wa_fcat-seltext_m = 'description'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 6.
  wa_fcat-fieldname = 'netwr'.
  wa_fcat-seltext_m = 'amount'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 7.
  wa_fcat-fieldname = 'waerk'.
  wa_fcat-seltext_m = 'currency'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 8.
  wa_fcat-fieldname = 'klmeng'.
  wa_fcat-seltext_m = 'quantity'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

  wa_fcat-col_pos = 9.
  wa_fcat-fieldname = 'vrkme'.
  wa_fcat-seltext_m = 'unti'.
  APPEND wa_fcat TO gt_fcat.
  CLEAR wa_fcat.

*LAYOUT : It is used to optimize the Column width of output.

  gt_layout-zebra = 'x'.
  gt_layout-colwidth_optimize = 'x'.


*Displaying ALV Grid

  CALL FUNCTION 'reuse_alv_grid_display'
    EXPORTING
      i_callback_program = sy-repid
      is_layout          = gt_layout
      it_fieldcat        = gt_fcat
    TABLES
      t_outtab           = gt_vbap
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
