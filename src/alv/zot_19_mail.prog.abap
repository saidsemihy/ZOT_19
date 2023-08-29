*&---------------------------------------------------------------------*
*& Report ZOT_19_MAIL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_19_MAIL.



DATA: go_gbt type ref to cl_gbt_multirelated_service,
      go_bcs type ref to cl_bcs,
      go_doc_bcs type ref to cl_document_bcs,
      go_recipient type ref to if_recipient_bcs,
      gt_soli type table of soli,
      gs_soli type soli,
      gv_status type bcs_rqst,
      gv_concent type string.

START-OF-SELECTION.
create OBJECT go_gbt.

gv_concent = 'Merhabalar, bu bir test maildir!'.

gt_soli = cl_document_bcs=>string_to_soli( gv_concent ).

call METHOD go_gbt->set_main_html
  EXPORTING
    content     = gt_soli.

go_doc_bcs = cl_document_bcs=>create_from_multirelated(
                                i_subject = 'Test Mail Başlığı'
                                i_multirel_service = go_gbt ).

go_recipient = cl_cam_address_bcs=>create_internet_address(
                                  i_address_string = 'saidsemihy@gmail.com' ).

go_bcs = cl_bcs=>create_persistent( ).
go_bcs->set_document( i_document = go_doc_bcs ).
go_bcs->add_recipient( i_recipient = go_recipient ).

gv_status = 'N'.
call METHOD go_bcs->set_status_attributes
  EXPORTING
    i_requested_status = gv_status.

go_bcs->send( ).
COMMIT WORK.
IF sy-subrc eq 0.
  message 'Mail başarılı bir şekilde gönderildi!' type 'I' DISPLAY LIKE 'S'.
ENDIF.
