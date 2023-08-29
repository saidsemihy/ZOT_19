*&---------------------------------------------------------------------*
*& Report ZOT_19_P_ALV_BAPI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_19_P_ALV_BAPI.
INCLUDE zssy_alv_odev_status_0100o01.
TABLES: vbrk.



""""""""""""""""""""""""""""
TYPES: BEGIN OF lty_tutar,
         id           TYPE vbeln,
         netpr        TYPE netpr,
         netpr_guncel TYPE netpr,
       END OF lty_tutar.
""""""""""""""""""""""""""""
CONSTANTS gc_log_button TYPE char4 VALUE '@0K@'.
DATA go_alv_grid TYPE REF TO cl_gui_alv_grid.
DATA go_alv_grid2 TYPE REF TO cl_gui_alv_grid.
DATA go_container TYPE REF TO cl_gui_custom_container.
DATA go_splitter TYPE REF TO cl_gui_splitter_container.
DATA go_gui1 TYPE REF TO cl_gui_container.
DATA go_gui2 TYPE REF TO cl_gui_container.
DATA: gt_baslik TYPE TABLE OF zssy_s_alv_odev.
DATA: gs_baslik TYPE zssy_s_alv_odev.
DATA: gt_baslik2 TYPE TABLE OF zssy_s_alv_odev.
DATA: gt_kalem TYPE TABLE OF zssy_s_alv_odev2_kalem.
DATA: gs_kalem TYPE  zssy_s_alv_odev2_kalem.
DATA: gt_log TYPE TABLE OF zssy_t_log.
DATA: gt_log2 TYPE TABLE OF zssy_t_log.
DATA: gs_log TYPE zssy_t_log.
DATA:ls_stable TYPE lvc_s_stbl.
DATA gs_layout TYPE lvc_s_layo.
DATA ls_link TYPE lvc_s_fcat.
DATA: ls_tutar TYPE lty_tutar.
DATA: lt_tutar TYPE TABLE OF lty_tutar.
DATA: go_salv TYPE REF TO cl_salv_table.
""""""
DATA : lt_index_rows TYPE lvc_t_row,
       lt_row_no     TYPE lvc_t_roid,
       ls_row_no     TYPE lvc_s_roid,
       ls_stylerow   TYPE lvc_s_styl,
       lt_stylerow   TYPE TABLE OF lvc_s_styl.
""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA: lt_fieldcat TYPE TABLE OF lvc_s_fcat,
      lt_style    TYPE TABLE OF lvc_t_styl,
      ls_style    TYPE lvc_s_styl.

FIELD-SYMBOLS: <gfs_fcat>  TYPE lvc_s_fcat,
               <gfs_kalem> TYPE zssy_s_alv_odev2_kalem.

DATA: gs_cell_color TYPE lvc_s_scol.
""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA gv_ekorg TYPE ekko-ekorg.
DATA gv_ekgrp TYPE ekko-ekgrp.
DATA gv_werks TYPE werks.
DATA gv_lgort TYPE lgort.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_ft_no FOR vbrk-vbeln.
  SELECT-OPTIONS s_ft_trh FOR vbrk-fkdat.
  SELECT-OPTIONS s_ft_tur FOR vbrk-fkart.
  SELECT-OPTIONS s_ft_ody FOR vbrk-kunrg.
SELECTION-SCREEN END OF BLOCK a1.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA: gs_poheader     TYPE  bapimepoheader.
DATA: gs_poheaderx    TYPE  bapimepoheaderx.
DATA: gt_poitem       TYPE TABLE OF bapimepoitem.
DATA: gt_poitemx      TYPE TABLE OF bapimepoitemx.
DATA: gs_poitem       TYPE bapimepoitem.
DATA: gs_poitemx      TYPE bapimepoitemx.
DATA: gt_bapiret2     TYPE TABLE OF bapiret2.
DATA: v_ebeln         TYPE ebeln.
DATA: gt_poaccount   TYPE TABLE OF bapimepoaccount.
DATA: gt_poaccountx	 TYPE TABLE OF bapimepoaccountx.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS cl_event_receiver DEFINITION.
  PUBLIC SECTION.
    METHODS handle_double_click
      FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING
        e_row
        e_column.

    METHODS handle_button_click
      FOR EVENT button_click OF cl_gui_alv_grid
      IMPORTING
        es_col_id
        es_row_no.
    METHODS handle_toolbar
      FOR EVENT toolbar OF cl_gui_alv_grid
      IMPORTING
        e_object
        e_interactive.
    METHODS handle_user_command
      FOR EVENT user_command OF cl_gui_alv_grid
      IMPORTING
        e_ucomm.

    METHODS handle_hotspot_click
      FOR EVENT hotspot_click OF cl_gui_alv_grid
      IMPORTING
        e_row_id
        e_column_id.

ENDCLASS.

CLASS cl_event_receiver IMPLEMENTATION.
  METHOD handle_hotspot_click.
*    DATA: lv_mess TYPE char200.


    READ TABLE gt_baslik INTO DATA(gs_baslik) INDEX e_row_id-index.

    SET PARAMETER ID 'VF' FIELD gs_baslik-vbeln."----->itab-vbeln
    CALL TRANSACTION 'VF03' AND SKIP FIRST SCREEN.

  ENDMETHOD.
  METHOD handle_double_click.
*    CALL SCREEN '0100'.

    DATA: lv_mess TYPE char200.
    READ TABLE gt_baslik INTO gs_baslik INDEX e_row-index.
    IF sy-subrc EQ 0.
      CLEAR gt_kalem.
*      CONCATENATE 'Tıklama kolon'
*                  e_column-fieldname
*                  ', satırın değeri'
*                  gs_baslik-vbeln
*                  INTO lv_mess
*                  SEPARATED BY space.
      SELECT vbrp~vbeln,
            vbrp~posnr,
            vbrp~fkimg,
            vbrp~vrkme,
            vbrp~meins,
            vbrk~waerk,
            vbrp~ntgew,
            vbrp~brgew,
            vbrp~netwr,
            vbrp~matnr,
            vbrp~arktx,
            vbrp~fkimg AS fkimg2,
            @gc_log_button AS log,
            vbrp~matkl

            FROM vbrp
            JOIN vbrk ON vbrk~vbeln = vbrp~vbeln
           WHERE vbrp~vbeln = @gs_baslik-vbeln
            INTO CORRESPONDING FIELDS OF TABLE @gt_kalem.


      LOOP AT gt_kalem ASSIGNING FIELD-SYMBOL(<gs_kal>).


        SELECT * UP TO 1 ROWS  FROM zssy_t_log INTO TABLE @gt_log
      WHERE vbeln = @<gs_kal>-vbeln
      AND posnr = @<gs_kal>-posnr
      ORDER BY datum DESCENDING,
         uzeit DESCENDING.
        IF NOT gt_log IS INITIAL.
          READ TABLE gt_log INTO gs_log WITH KEY vbeln = <gs_kal>-vbeln.
          <gs_kal>-netpr_guncel = gs_log-netpr_guncel.
        ENDIF.

      ENDLOOP.
      LOOP AT gt_kalem ASSIGNING <gfs_kalem>.
*        CASE <gfs_kalem>-netpr_guncel.
*          WHEN 0.
*            <gfs_kalem>-line_color = 'C701'.
*        ENDCASE.
        IF <gfs_kalem>-netpr_guncel > 0.
          gs_cell_color-fname = 'NETPR_GUNCEL'.
          gs_cell_color-color-col = '6'.
          gs_cell_color-color-int = '1'.
          gs_cell_color-color-inv = '0'.
          APPEND gs_cell_color TO <gfs_kalem>-cell_color.

        ENDIF.
      ENDLOOP.

      go_alv_grid2->refresh_table_display( ).

      go_alv_grid2->get_frontend_fieldcatalog(
  IMPORTING
    et_fieldcatalog = DATA(lt_field_catalog2)
).

      LOOP AT gt_kalem ASSIGNING FIELD-SYMBOL(<gs_kalem>).
        <gs_kalem>-netpr = <gs_kalem>-netwr / <gs_kalem>-fkimg.
      ENDLOOP.

      LOOP AT gt_kalem INTO DATA(gs_kal).
        READ TABLE lt_field_catalog2 ASSIGNING FIELD-SYMBOL(<ls_field>) WITH KEY fieldname = 'NETPR_GUNCEL'.
        IF gs_kal-netpr > 100.
          <ls_field>-edit = abap_true.
        ELSE.
          <ls_field>-edit = abap_false.
        ENDIF.
      ENDLOOP.
      go_alv_grid2->set_frontend_fieldcatalog( lt_field_catalog2 ).

      go_alv_grid2->refresh_table_display( ).
    ENDIF.

  ENDMETHOD.

  METHOD handle_button_click.

    READ TABLE gt_kalem INTO gs_kalem INDEX es_row_no-row_id.
    SELECT *
            FROM zssy_t_log
           INTO CORRESPONDING FIELDS OF TABLE @gt_log
           WHERE vbeln = @gs_kalem-vbeln
           AND posnr = @gs_kalem-posnr.
*      IF ls_row_no IS INITIAL.
    IF gt_log IS INITIAL.
      MESSAGE 'Seçilen kalem için log tablosu bulunamadı!' TYPE 'I'.
      RETURN.
    ENDIF.

    TRY.


        cl_salv_table=>factory( IMPORTING r_salv_table   = go_salv
                                 CHANGING t_table        = gt_log ).

        go_salv->set_screen_popup(
           EXPORTING
             start_column = 10
             end_column   = 100
             start_line   = 5
             end_line     = 20
         ).

        go_salv->display( ).
      CATCH cx_salv_msg.

    ENDTRY.

  ENDMETHOD.
  METHOD handle_toolbar.
    DATA: ls_toolbar TYPE stb_button.
    CLEAR: ls_toolbar.
    ls_toolbar-function = '&DEL'.
    ls_toolbar-text = 'Silme'.
    ls_toolbar-icon = '@11@'.
    ls_toolbar-quickinfo = 'Silme İşlemi'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.
    CLEAR: ls_toolbar.
    ls_toolbar-function = '&SAV'.
    ls_toolbar-text = 'Kaydet'.
    ls_toolbar-icon = '@2L@'.
    ls_toolbar-quickinfo = 'Kaydetme İşlemi'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.
    CLEAR: ls_toolbar.
    ls_toolbar-function = '&SAS'.
    ls_toolbar-text = 'SAS Oluştur'.
    ls_toolbar-icon = '@0Y@'.
    ls_toolbar-quickinfo = 'Kaydetme İşlemi'.
    ls_toolbar-disabled = abap_false.
    APPEND ls_toolbar TO e_object->mt_toolbar.
  ENDMETHOD.
  METHOD handle_user_command.
    CASE e_ucomm.
      WHEN '&DEL'.
        MESSAGE 'SILME ISLEMI' TYPE 'I'.
      WHEN '&SAV'.

        go_alv_grid2->get_selected_rows(
          IMPORTING
            et_index_rows = lt_index_rows
            et_row_no     = lt_row_no
        ).

        IF lt_row_no IS INITIAL.
          MESSAGE 'Lütfen kaydedeceğiniz satırı seçin!' TYPE 'I'.
          RETURN.
        ENDIF.

        LOOP AT lt_row_no INTO ls_row_no.
          READ TABLE gt_kalem INDEX ls_row_no-row_id INTO gs_kalem.


          SELECT * UP TO 1 ROWS  FROM zssy_t_log INTO TABLE @gt_log
          WHERE vbeln = @gs_kalem-vbeln
          AND posnr = @gs_kalem-posnr
          ORDER BY datum DESCENDING,
             uzeit DESCENDING.



*            read table gt_log into gs_log with KEY uzeit 'posnr'.
          LOOP AT gt_log INTO gs_log.
            IF gs_log-netpr_guncel EQ gs_kalem-netpr_guncel.
              MESSAGE 'Log tablosundaki son kayıt ile aynı değer girdiniz!' TYPE 'I'.
              RETURN.
            ENDIF.
            .
          ENDLOOP.


*          sort gt_log DESCENDING by datum.


          gs_log-mandt = sy-mandt.
          gs_log-vbeln = gs_kalem-vbeln.
          gs_log-posnr = gs_kalem-posnr.
          gs_log-datum = sy-datum.
          gs_log-uzeit = sy-uzeit.
          gs_log-netpr = gs_kalem-netpr.
          gs_log-netpr_guncel = gs_kalem-netpr_guncel.
          gs_log-uname = sy-uname.

          INSERT zssy_t_log FROM gs_log.
        ENDLOOP.
        LOOP AT gt_kalem ASSIGNING <gfs_kalem>.
*        CASE <gfs_kalem>-netpr_guncel.
*          WHEN 0.
*            <gfs_kalem>-line_color = 'C701'.
*        ENDCASE.
          IF <gfs_kalem>-netpr_guncel > 0.
            gs_cell_color-fname = 'NETPR_GUNCEL'.
            gs_cell_color-color-col = '6'.
            gs_cell_color-color-int = '1'.
            gs_cell_color-color-inv = '0'.
            APPEND gs_cell_color TO <gfs_kalem>-cell_color.
          ELSE.
            CLEAR <gfs_kalem>-cell_color.
          ENDIF.
        ENDLOOP.
        go_alv_grid2->refresh_table_display( ).
      WHEN '&SAS'.

        CALL SCREEN '0101' STARTING AT 10 10
                               ENDING AT 50 20.

        READ TABLE gt_kalem INTO gs_kalem WITH KEY vbeln = gs_baslik.

        "BAPIMEPOHEADER
        CLEAR: gs_poheader.
        gs_poheader-comp_code    = '1710'.
        "gs_poheader-comp_code    = gs_baslik-kunag.
        gs_poheader-doc_type     = 'NB'.
        gs_poheader-purch_org    = gv_ekorg.
        gs_poheader-pur_group    = gv_ekgrp.
        gs_poheader-vendor = '643266'. "Sonradan
*        gs_poheader-purch_org    = '1710'.


        gs_poheaderx-comp_code = 'X'.
        gs_poheaderx-doc_type = 'X'.
        gs_poheaderx-purch_org = 'X'.
        gs_poheaderx-pur_group = 'X'.
*        APPEND INITIAL LINE TO gt_poitem ASSIGNING FIELD-SYMBOL(<fs_item>).

        "BAPIMEPOITEM


        CLEAR: gs_poitem.
        gs_poitem-po_item = '10'.
        gs_poitem-material = gs_kalem-matnr.
        gs_poitem-short_text = gs_kalem-arktx.
        gs_poitem-plant = gv_werks.
        gs_poitem-stge_loc = gv_werks.
        gs_poitem-matl_group = gs_kalem-matkl.
        gs_poitem-quantity = gs_kalem-fkimg.
        gs_poitem-po_unit = gs_kalem-vrkme.
        gs_poitem-info_upd = 'X'.
        gs_poitem-pckg_no = '01'.
*        gs_poitem-po_item = '10'. "Sonradan
        APPEND gs_poitem TO gt_poitem.

        CLEAR: gs_poitemx.
        gs_poitemx-po_itemx = 'X'.
        gs_poitemx-material = 'x'.
        gs_poitemx-short_text = 'X'.
        gs_poitemx-plant = 'X'.
        gs_poitemx-stge_loc = 'X'.
        gs_poitemx-matl_group = 'X'.
        gs_poitemx-quantity = 'X'.
        gs_poitemx-po_unit = 'X'.
        gs_poitemx-info_upd = 'X'.
        gs_poitemx-pckg_no = 'X'.
        gs_poitemx-po_item = '10'. "Sonradan
        APPEND gs_poitemx TO gt_poitemx.

        APPEND INITIAL LINE TO gt_poaccount ASSIGNING FIELD-SYMBOL(<fs_account>).
        <fs_account>-po_item = '10'.
        <fs_account>-serial_no = '01'.

        APPEND INITIAL LINE TO gt_poaccountx ASSIGNING FIELD-SYMBOL(<fs_accountx>).
        <fs_accountx>-po_itemx = 'X'.
        <fs_accountx>-po_item = '10'. "Sonradan
        <fs_accountx>-serial_nox = 'X'.

        CALL FUNCTION 'BAPI_PO_CREATE1'
          EXPORTING
            poheader   = gs_poheader
            poheaderx  = gs_poheaderx
*         IMPORTING
*           EXPPURCHASEORDER             =
*           EXPHEADER  =
*           EXPPOEXPIMPHEADER            =
          TABLES
            return     = gt_bapiret2
            poitem     = gt_poitem
            poitemx    = gt_poitemx
            poaccount  = gt_poaccount
            poaccountx = gt_poaccountx.













        BREAK-POINT.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

START-OF-SELECTION.
*
*            vbrp~fkimg AS fkimg2,
*            @gc_log_button AS log

  SELECT vbrk~vbeln,
         vbrk~bukrs,
         vbrk~fkdat,
         vbrk~fkart,
         vbrk~kunrg,
         vbrk~fktyp,
         vbrk~vkorg,
         vbrk~vtweg,
         vbrk~netwr,
         vbrk~waerk,

         vbrk~kunag


    FROM vbrk
    INNER JOIN vbrp ON vbrp~vbeln = vbrk~vbeln
    INTO CORRESPONDING FIELDS OF TABLE @gt_baslik
    WHERE vbrk~vbeln IN @s_ft_no
    AND vbrk~fkdat IN @s_ft_trh
    AND vbrk~fkart IN @s_ft_tur
    AND vbrk~kunrg IN @s_ft_ody.

  SELECT vbrp~vbeln, COUNT( vbrp~posnr ) AS item_count FROM vbrp
    GROUP BY vbrp~vbeln
    INTO TABLE @DATA(lt_item_count).

*READ TABLE lt_field_catalog2 ASSIGNING FIELD-SYMBOL(<ls_catalog>) WITH KEY fieldname = 'LOG'.
*    LOOP AT gt_baslik  into  data(gs_baslik).
  LOOP AT gt_baslik ASSIGNING FIELD-SYMBOL(<gs_baslik>).
    READ TABLE lt_item_count INTO DATA(ls_item_count) WITH KEY vbeln = <gs_baslik>-vbeln.
    <gs_baslik>-item_count = ls_item_count-item_count.
*      modify gt_baslik FROM gs_baslik.
  ENDLOOP.

*    select vbrk~vbeln,
*         vbrk~bukrs,
*         vbrk~fkdat,
**         vbrk~fkart,
**         vbrk~kunrg,
**         vbrk~fktyp,
*         vbrk~vkorg,
*         vbrk~vtweg,
*         vbrk~kunrg,
*         vbrk~netwr,
*         vbrk~waerk from vbrk into CORRESPONDING FIELDS OF @gt_baslik2.
**    loop at gt_baslik into data(gs_baslik).
**
**      ENDLOOP.

  go_container = NEW cl_gui_custom_container( 'CC_ALV' ).

  CREATE OBJECT go_splitter
    EXPORTING
      parent  = go_container
      rows    = 2
      columns = 1.

  go_gui1 = go_splitter->get_container(  row    = 1
                                         column = 1 ).
  go_gui2 = go_splitter->get_container( row    = 2
                                        column = 1 ).
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  go_alv_grid = NEW cl_gui_alv_grid( i_parent = go_gui1 ).




  gs_layout-cwidth_opt = 'X'.

  go_alv_grid->set_table_for_first_display(
  EXPORTING
    i_structure_name              = 'ZSSY_S_ALV_ODEV'
    is_layout                     = gs_layout
    CHANGING
      it_outtab                     = gt_baslik
*      it_fieldcatalog               = lt_field_catalog
  EXCEPTIONS
    invalid_parameter_combination = 1
    program_error                 = 2
    too_many_lines                = 3
    OTHERS                        = 4
  ).


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  gs_layout-info_fname = 'LINE_COLOR'.
  gs_layout-ctab_fname = 'CELL_COLOR'.


  go_alv_grid2 = NEW cl_gui_alv_grid( i_parent = go_gui2 ).

  go_alv_grid2->set_table_for_first_display(
  EXPORTING
    i_structure_name              = 'ZSSY_S_ALV_ODEV2_KALEM'
    is_layout                     = gs_layout
    CHANGING
      it_outtab                     = gt_kalem



*      it_fieldcatalog               = lt_field_catalog2
  EXCEPTIONS
    invalid_parameter_combination = 1
    program_error                 = 2
    too_many_lines                = 3
    OTHERS                        = 4
  ).

  go_alv_grid2->get_frontend_fieldcatalog(
    IMPORTING
      et_fieldcatalog = DATA(lt_field_catalog2)
  ).

  READ TABLE lt_field_catalog2 ASSIGNING FIELD-SYMBOL(<ls_catalog>) WITH KEY fieldname = 'LOG'.
  <ls_catalog>-style = cl_gui_alv_grid=>mc_style_button.
  <ls_catalog>-icon = abap_true.

  LOOP AT lt_field_catalog2 ASSIGNING <gfs_fcat>.
    IF <gfs_fcat>-fieldname EQ 'VBELN'.
      <gfs_fcat>-hotspot = abap_true.
    ENDIF.
  ENDLOOP.

  go_alv_grid2->set_frontend_fieldcatalog( lt_field_catalog2 ).
  go_alv_grid2->refresh_table_display( ) .


  go_alv_grid->get_frontend_fieldcatalog(
    IMPORTING
      et_fieldcatalog = DATA(lt_field_catalog)
  ).
  LOOP AT lt_field_catalog ASSIGNING <gfs_fcat>.
    IF <gfs_fcat>-fieldname EQ 'VBELN'.
      <gfs_fcat>-hotspot = abap_true.
    ENDIF.
  ENDLOOP.
  go_alv_grid->set_frontend_fieldcatalog( lt_field_catalog ).
  go_alv_grid->refresh_table_display( ).




  DATA: lr_handle TYPE REF TO cl_event_receiver.
  CREATE OBJECT lr_handle.
  SET HANDLER lr_handle->handle_double_click FOR go_alv_grid.
  SET HANDLER lr_handle->handle_hotspot_click FOR go_alv_grid.
  SET HANDLER lr_handle->handle_hotspot_click FOR go_alv_grid2.
  SET HANDLER lr_handle->handle_button_click FOR go_alv_grid2.
  SET HANDLER lr_handle->handle_toolbar FOR go_alv_grid2.
  SET HANDLER lr_handle->handle_user_command FOR go_alv_grid2.

  CALL SCREEN '0100'.

  INCLUDE zssy_alv_odev_status_0101o01.
