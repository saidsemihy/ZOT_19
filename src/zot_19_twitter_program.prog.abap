*&---------------------------------------------------------------------*
*& Report zot_19_twitter_program
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_twitter_program.

SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_tt_id  TYPE i,
              p_tt_dsc TYPE char100.

SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.

  PARAMETERS:
    p_tw_at  RADIOBUTTON GROUP g1,
    p_tw_dgs RADIOBUTTON GROUP g1,
    p_tw_sil RADIOBUTTON GROUP g1,
    p_tw_gst RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK a2.

DATA lt_main_modify TYPE TABLE OF zot_19_t_twitter.

START-OF-SELECTION.

  IF p_tw_at EQ abap_true.

    SELECT SINGLE COUNT( * )
    FROM zot_19_t_twitter
    WHERE id = p_tt_id.
    IF sy-subrc = 0.

      MESSAGE 'Daha önce oluşturulmuş ID!' TYPE 'I'.
    ELSE.
      APPEND VALUE #( id        = p_tt_id
                  tweet = p_tt_dsc
             ) TO lt_main_modify.

      INSERT zot_19_t_twitter FROM TABLE lt_main_modify.
      MESSAGE 'Yeni Tweet başarıyla oluşturulmuştur!' TYPE 'I'.
    ENDIF.


  ELSEIF p_tw_dgs EQ abap_true.

    SELECT SINGLE COUNT( * )
   FROM zot_19_t_twitter
   WHERE id = p_tt_id.

    IF sy-subrc = 0.
      UPDATE zot_19_t_twitter SET tweet = p_tt_dsc
  WHERE id = p_tt_id.
      MESSAGE 'Kayıt başarıyla güncellenmiştir!' TYPE 'I'.
    ELSE.
      MESSAGE 'Güncellenicek ID bulunamadı' TYPE 'I'.
    ENDIF.

  ELSEIF p_tw_sil EQ abap_true.
    SELECT SINGLE COUNT( * )
  FROM zot_19_t_twitter
  WHERE id = p_tt_id.

    IF sy-subrc = 0.
      DELETE FROM zot_19_t_twitter WHERE id = p_tt_id.
      MESSAGE 'Kayıt başarıyla silindi!' TYPE 'I'.
    ELSE.
      MESSAGE 'Silinicek kayıta ait ID bulunamadı!' TYPE 'I'.
    ENDIF.
  ELSEIF p_tw_gst EQ abap_true.


    SELECT tweet
    FROM zot_19_t_twitter
    INTO TABLE @DATA(abapitter).
    IF sy-subrc = 0.
      cl_demo_output=>display( abapitter ).
    ELSE.
      MESSAGE 'Kayıt bulunamadı!' type 'I'.
    ENDIF.


  ENDIF.
