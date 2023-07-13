*&---------------------------------------------------------------------*
*& Report zot_19_p_open_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_open_sql.

*data gv_banfn type eban-banfn.
*
*data gs_eban type eban.
*
*data gt_eban type table of eban.
*
*START-OF-SELECTION.
*
*select single banfn "Satırda ilk gordügünü alır
*from eban
*where bsart eq 'NB' "String sorgularında büyük küçük duyarlı !! neyse onu yaz
*into @gv_banfn.
*
*
*
*write gv_banfn.
*
*  SELECT SINGLE loekz  "2 tane key oldugu için 2 keye deger verdim
*  FROM eban
*  WHERE banfn = '10000023'
*    AND bnfpo = '0020'
*  INTO @DATA(lv_loekz).
*
*  WRITE lv_loekz.
*  WRITE lv_loekz.
*
*  SELECT SINGLE loekz
*    FROM eban
*    WHERE banfn = '0010000023'
*    AND bnfpo = '0020'
*    INTO @lv_loekz.
*
*  IF sy-subrc = 0.
*    WRITE :/ lv_loekz.
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.

*  SELECT SINGLE banfn
*  FROM eban
*  WHERE bsart EQ 'NB'
*  INTO @gv_banfn.
*
*  SELECT SINGLE loekz
*  FROM eban
*  WHERE banfn = '0010000023'
*    AND bnfpo = '0020'
*  INTO @DATA(lv_loekz).
*  IF sy-subrc = 0.
*    WRITE :/ lv_loekz.
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.

*  SELECT SINGLE loekz
*    FROM eban
*    WHERE banfn = '0010000023'
*    AND bnfpo = '0020'
*    INTO @lv_loekz.
*
*  IF sy-subrc = 0.
*    WRITE :/ lv_loekz.
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.

*  SELECT SINGLE id
*  FROM zot_098_t_main
*  WHERE age GT 10
*  INTO @DATA(lv_id).



*  SELECT SINGLE banfn, bsart
*  FROM eban
*  WHERE banfn = '0010000023'
*  AND bnfpo = '0020'
*  INTO CORRESPONDING FIELDS OF @gs_eban.
*
*  IF sy-subrc = 0.
*    WRITE :/ gs_eban-banfn, gs_eban-bsart.
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.



*  SELECT SINGLE banfn, bsart
*  FROM eban
*  WHERE banfn = '0010000023'
*  AND bnfpo = '0020'
*  INTO @DATA(ls_eban).
*
*  IF sy-subrc = 0.
**    WRITE :/ ls_eban-banfn, ls_eban-bsart.
*    cl_demo_output=>display( ls_eban ).
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.


*  SELECT *
*  FROM eban
*  WHERE banfn = '0010000023'
**  AND bnfpo = '20
*  INTO TABLE @gt_eban.
*
*  SELECT banfn,
*         bnfpo,
*         bsart
*  FROM eban
*  WHERE banfn = '0010000023'
*    AND bnfpo = '00020'
*  INTO TABLE @DATA(lt_eban).
*  IF sy-subrc = 0.
*    cl_demo_output=>display( lt_eban ).
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.

*  DATA lr_id TYPE RANGE OF zot_098_t_main-id.

*  APPEND VALUE #( sign = 'I ' option = 'EQ' low = 001 ) TO lr_id.
*  APPEND VALUE #( sign = 'I ' option = 'EQ' low = 016 ) TO lr_id.

*  APPEND VALUE #( sign = 'I ' option = 'BT' low = 001 high = 016 ) TO lr_id.

*  SELECT id,
*         name
*  FROM zot_098_t_main
*  WHERE id IN @lr_id
*  INTO TABLE @DATA(lt_main).
*  IF sy-subrc = 0.
*    cl_demo_output=>display( lt_main ).
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.

*

*  SELECT id,
*         name
*  FROM zot_098_t_main
*  WHERE id IN @s_id
*  INTO TABLE @DATA(lt_main).
*  IF sy-subrc = 0.
*    cl_demo_output=>display( lt_main ).
*  ELSE.
*    WRITE :/ 'Error'.
*  ENDIF.


*data: sayi type i,
*      sayi2 type p,
*      yazi type String,
*      lv_date2 type d,
*      xtype type x.
*      lv_date2 = '112023'.
*      sayi2 = 3.
*      lv_date2 = lv_date2 + 1.

*data : lv_time type t.
*       lv_time = '235906'.
*       lv_time = lv_time + 1.

DATA : lv_baslangic_tarih TYPE d,
       lv_baslangic_saat  TYPE t,
       lv_bitis_tarih     TYPE d,
       lv_bitis_saat      TYPE t,
       lv_fark_gun        TYPE i,
       lv_fark_ay         TYPE i,
       lv_fark_yil        TYPE i,
       lv_fark_saat       TYPE i,
       lv_fark_dakika     TYPE i,
       lv_fark_saniye     TYPE i.







lv_baslangic_tarih = '20211004'.
lv_bitis_tarih = '20211105'.
lv_fark_gun = lv_bitis_tarih - lv_baslangic_tarih.
lv_fark_ay = lv_fark_gun / 30.
lv_fark_yil = lv_fark_gun / 360.
WRITE : / 'Arasındaki gün' , lv_fark_gun.
WRITE : / 'Arasındaki ay' , lv_fark_ay.
WRITE : / 'Arasındaki yıl' , lv_fark_yil.

*WRITE lv_baslangic_tarih DD/MM/YYYY.

lv_baslangic_saat = '230500'.
lv_bitis_saat = '010500'.



IF lv_bitis_saat > lv_baslangic_saat.

  lv_fark_saniye = lv_bitis_saat - lv_baslangic_saat.

ELSE.
  lv_fark_saniye = lv_baslangic_saat - lv_bitis_saat.

ENDIF.

lv_fark_dakika = lv_fark_saniye / 60.
lv_fark_saat = lv_fark_dakika / 60.
IF lv_fark_saat > 12.
      lv_fark_saat = 24 - lv_fark_saat.

  ENDIF.

WRITE : / 'saat' , lv_fark_saat.
WRITE : / 'dakika' , lv_fark_dakika.
WRITE : / 'saniye' , lv_fark_saniye.


*04.10.2021
*05.11.2021




*break otsyalcin.
