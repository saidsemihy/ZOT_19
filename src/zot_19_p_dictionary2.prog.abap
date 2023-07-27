*&---------------------------------------------------------------------*
*& Report zot_19_p_dictionary2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_dictionary2.

DATA: ls_notlar TYPE zot_19_s_ogr_not,
      ls_sinif type zot_19_s_sinif,
      ls_ders type zot_19_s_ders,
      ls_not type zot_19_s_not,
      lt_notlar TYPE TABLE OF zot_19_s_ogr_not.

ls_not-vize_1 = '10'.
ls_not-vize_2 = '20'.
ls_not-final = '30'.
ls_not-butunleme = '40'.

ls_ders-ders_1 = ls_not.
ls_sinif-sinif_1_notlari = ls_ders.
ls_notlar-notlar = ls_sinif.
ls_notlar-bolum = 'Yazilim Muhendisligi'.
ls_notlar-dogum_tarihi = '30.08.2001'.
ls_notlar-ogrenci_ad = 'Said Semih Yalçın'.
ls_notlar-ogrenci_id = '2012101060'.

append ls_notlar to lt_notlar.
cl_demo_output=>write( lt_notlar ).
cl_demo_output=>display(  ).


*lt_notlar = VALUE #(  (
*                                               ogrenci_id = '1'
*                                               ogrenci_ad = 'Said Semih Yalcin'
*                                               dogum_tarihi = '30.08.2001'
*                                               bolum = 'Yazilim Muhendisligi'
*                                               notlar = VALUE #( (
*                                               sinif_1_notlari = VALUE #( (
*                                               ders_1 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_2 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_3 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_4 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                                 )
*                                               sinif_2_notlari = VALUE #( (
*                                               ders_1 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_2 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_3 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_4 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                                 )
*                                               sinif_3_notlari = VALUE #( (
*                                               ders_1 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_2 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_3 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_4 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                                 )
*                                               sinif_4_notlari = VALUE #( (
*                                               ders_1 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_2 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_3 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                               ders_4 = VALUE #( (
*                                               vize_1 = '10'
*                                               vize_2 = '20'
*                                               final = '30'
*                                               butunleme = '40'
*                                                 )
*                                                 )
*                                                 ) .
