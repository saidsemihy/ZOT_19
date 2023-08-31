*&---------------------------------------------------------------------*
*& Include          ZOT_19_P_MAIL_CLS
*&---------------------------------------------------------------------*

CLASS lcl_main DEFINITION CREATE PRIVATE FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO lcl_main.

    METHODS: start_of_selection.

    DATA: go_gbt       TYPE REF TO cl_gbt_multirelated_service,
          go_bcs       TYPE REF TO cl_bcs,
          go_doc_bcs   TYPE REF TO cl_document_bcs,
          go_recipient TYPE REF TO if_recipient_bcs,
          gt_soli      TYPE TABLE OF soli,
          gs_soli      TYPE soli,
          gv_status    TYPE bcs_rqst,
          gv_concent   TYPE string,
          gv_sayac     TYPE i,
          gt_lips      TYPE TABLE OF lips,
          gt_mail      TYPE TABLE OF zssy_t_mail.

  PRIVATE SECTION.
    METHODS: concent,
      get_data,
      send_mail.

    CLASS-DATA:
      mo_instance TYPE REF TO lcl_main.
ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD concent.

  ENDMETHOD.

  METHOD start_of_selection.
    get_data( ).
    send_mail( ).
  ENDMETHOD.

  METHOD get_instance.
    IF mo_instance IS INITIAL.
      mo_instance = NEW #( ).
    ENDIF.
    ro_instance = mo_instance.
  ENDMETHOD.

  METHOD get_data.
    SELECT lips~vbeln,
       lips~posnr,
       lips~matnr,
       lips~ntgew,
       lips~brgew,
       lips~gewei
  FROM lips
 WHERE vbeln IN @s_teslim
  INTO CORRESPONDING FIELDS OF TABLE @gt_lips.
    "Girdiğim vbeln'e göre oluşturduğum zli tablomdan o vbelne ait kayıtları çekiyorum
    "bu mail adreslerine mail atacağız
    SELECT vbeln_va,
           gonderilecek_mail,
           cc,
           bcc
      FROM zssy_t_mail AS table
     WHERE vbeln_va IN @s_teslim
      INTO CORRESPONDING FIELDS OF TABLE @gt_mail.
  ENDMETHOD.


  METHOD send_mail.
    CREATE OBJECT go_gbt.


    LOOP AT gt_lips ASSIGNING FIELD-SYMBOL(<ls_lips>)
      GROUP BY <ls_lips>-vbeln
      ASCENDING.


      gv_concent = 'Sayın ilgili;'
                 &&  <ls_lips>-vbeln && ' teslimatının, malzeme bazında brüt ve net ağırlığı aşağıda belirtilmiştir.'
                 && '<!DOCTYPE html>'
                 && '<html>'
                 && '<head>'
                 && '<meta charset="utf-8">'
                 && '<title>4 Sütunlu HTML Tablosu</title>'
                 && '</head>'
                 && '<body>'
                 && ''
                 && ' <table border="1">'
                 && '<tr>'
                 && '<th>MATNR</th>'
                 && '<th>NTGEW</th>'
                 && '<th>BRGEW</th>'
                 && '<th>GEWEI</th>'
                 && '</tr>'.

      LOOP AT GROUP <ls_lips> ASSIGNING FIELD-SYMBOL(<ls_grouped_lips>).
        gv_concent = gv_concent
                      && '     <tr>                                     '
                      && ' <td> ' && <ls_grouped_lips>-matnr && ' </td> '
                      && ' <td> ' && <ls_grouped_lips>-ntgew && ' </td> '
                      && ' <td> ' && <ls_grouped_lips>-brgew && ' </td> '
                      && ' <td> ' && <ls_grouped_lips>-gewei && ' </td> '
                      && '     </tr>                                    '.
      ENDLOOP.

      gv_concent = gv_concent
                     && '</table>'
                     && '</body>'
                     && '</html>'.


      gt_soli = cl_document_bcs=>string_to_soli( gv_concent ).

      CALL METHOD go_gbt->set_main_html
        EXPORTING
          content = gt_soli.

      go_doc_bcs = cl_document_bcs=>create_from_multirelated(
                                    i_subject = 'Mail Processing Homework'
                                    i_multirel_service = go_gbt ).

      go_bcs = cl_bcs=>create_persistent( ).

      go_bcs->set_document( i_document = go_doc_bcs ).

      LOOP AT gt_mail ASSIGNING FIELD-SYMBOL(<gs_mail>) WHERE vbeln_va = <ls_lips>-vbeln.

        go_recipient = cl_cam_address_bcs=>create_internet_address(
                              i_address_string = <gs_mail>-gonderilecek_mail ).

        IF <gs_mail>-cc EQ abap_true.
          go_bcs->add_recipient( i_recipient = go_recipient
                                         i_copy      = 'X' ).
        ELSEIF <gs_mail>-bcc EQ abap_true.
          go_bcs->add_recipient( i_recipient = go_recipient
                                        i_blind_copy      = 'X' ).
        ELSE.
          go_bcs->add_recipient( i_recipient = go_recipient ).
        ENDIF.
      ENDLOOP.

      gv_status = 'N'.
      CALL METHOD go_bcs->set_status_attributes
        EXPORTING
          i_requested_status = gv_status.
      go_bcs->send( ).
      COMMIT WORK.
    ENDLOOP.

    IF sy-subrc EQ 0.
      MESSAGE 'Mail başarılı bir şekilde gönderildi!' TYPE 'I' DISPLAY LIKE 'S'.
    ENDIF.

    IF sy-subrc NE 0.
      MESSAGE 'Girilen teslimat kaydına ait veri bulunamadı!' TYPE 'I' DISPLAY LIKE 'E'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
