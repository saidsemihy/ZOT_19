*&---------------------------------------------------------------------*
*& Report zot_19_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_zmn.



DATA : lv_fark_gun    TYPE i,
       lv_fark_ay     TYPE i,
       lv_fark_yil    TYPE i,
       lv_fark_saat   TYPE i,
       lv_fark_dakika TYPE i,
       lv_fark_saniye TYPE i.

TABLES: zot_19_t_zmn.
DATA: lt_hesapla TYPE TABLE OF zot_19_t_zmn.
DATA: ls_hesapla TYPE  zot_19_t_zmn.


SELECTION-SCREEN BEGIN OF BLOCK a3 WITH FRAME TITLE TEXT-003.

  SELECT-OPTIONS s_id FOR zot_19_t_zmn-id.

SELECTION-SCREEN END OF BLOCK a3.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.
  PARAMETERS p_option RADIOBUTTON GROUP g1.
  PARAMETERS p_goster RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK a2.



START-OF-SELECTION.
  IF p_goster EQ abap_true. "Tüm verileri çeker

    SELECT id,
           baslangic_tarihi ,
           baslangic_saati  ,
           bitis_tarihi     ,
           bitis_saati
     FROM zot_19_t_zmn
     INTO TABLE @DATA(tarih_zaman).
     sort tarih_zaman ASCENDING by id.
    IF sy-subrc = 0.
      cl_demo_output=>display( tarih_zaman ).
    ELSE.
      MESSAGE 'Kayıt bulunamadı!' TYPE 'I'.
    ENDIF.


  ELSEIF p_option EQ abap_true.

    SELECT *
      INTO TABLE lt_hesapla
      FROM zot_19_t_zmn
      WHERE id IN s_id.

    SORT lt_hesapla ASCENDING BY id."id göre küçüktek büyüğe sıralı çekilde yazmak için sıraladık
    LOOP AT lt_hesapla INTO ls_hesapla.
*            WRITE: / 'Başlangıç Saati:', ls_hesapla-baslangic_saati,
*           'Başlangıç Tarihi:', ls_hesapla-baslangic_tarihi,
*           'Bitiş Tarihi:', ls_hesapla-bitis_tarihi,
*           'Bitiş Saati:', ls_hesapla-bitis_saati.
      WRITE /.
      PERFORM zaman_hesapla USING
                           ls_hesapla-id
                           ls_hesapla-baslangic_saati
                           ls_hesapla-baslangic_tarihi
                           ls_hesapla-bitis_saati
                           ls_hesapla-bitis_tarihi.
    ENDLOOP.


  ENDIF.


FORM zaman_hesapla USING  id
                          baslangic_saati
                          baslangic_tarihi
                          bitis_saati
                          bitis_tarihi.

  lv_fark_gun = bitis_tarihi - baslangic_tarihi.

  IF bitis_saati < baslangic_saati.
    lv_fark_saniye  = 86400 + ( bitis_saati - baslangic_saati ) ."Başlangıç saati daha büyükse 1 gün geçmemiş olur
                                                                 "o sebepten gün eksilttik ve 1 günlük saniyeden farkı çıkardık
    lv_fark_gun = lv_fark_gun - 1.
  ELSE.
    lv_fark_saniye =  ( bitis_saati - baslangic_saati ).

  ENDIF.

  lv_fark_dakika = lv_fark_saniye DIV 60.
  lv_fark_saniye = lv_fark_saniye MOD 60.
  lv_fark_saat = lv_fark_dakika DIV 60.
  lv_fark_dakika = lv_fark_dakika MOD 60.
  lv_fark_yil = lv_fark_gun dıv 365.
  lv_fark_gun = lv_fark_gun MOD 365.
  lv_fark_ay = lv_fark_gun DIV 30.
  lv_fark_gun = lv_fark_gun MOD 30.

  PERFORM write_form USING id.
ENDFORM.

FORM write_form USING id.

  SHIFT id LEFT DELETING LEADING '0'. "Başındaki 0'ları silip öyle ekrana yazdırır

  WRITE |{ id } INDEX ait kayıtta;     |.
  IF lv_fark_yil NE 0.
    WRITE : | { lv_fark_yil } YIL| .
  ENDIF.
  IF lv_fark_ay NE 0.
    WRITE : | { lv_fark_ay } AY|.
  ENDIF.
  IF lv_fark_gun NE 0.
    WRITE : | { lv_fark_gun } GUN|.
  ENDIF.
  IF lv_fark_saat NE 0.
    WRITE : | { lv_fark_saat } SAAT|.
  ENDIF.
  IF lv_fark_dakika NE 0.
    WRITE : | { lv_fark_dakika } DAKIKA|.
  ENDIF.
  IF lv_fark_saniye NE 0.
    WRITE : | { lv_fark_saniye } SANIYE|.
  ENDIF.
  WRITE : | Fark Vardır. |.
ENDFORM.
