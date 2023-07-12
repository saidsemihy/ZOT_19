*&---------------------------------------------------------------------*
*& Report zot_19_abap_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_abap_dictionary.

*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*TYPES: BEGIN OF lty_personel,
*         id        TYPE zot_19_e_ad,
*         ad        TYPE zot_19_e_ad,
*         yas       TYPE zot_19_e_yas,
*         departman TYPE zot_19_e_departman,
*         unvan     TYPE zot_19_e_unvan,
*       END OF lty_personel.
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*DATA: ls_personel_1 TYPE lty_personel.
*ls_personel_1-id = 'Said Semih'.
*ls_personel_1-ad = 'Said Semih'.
*ls_personel_1-yas = 'Said Semih'.
*ls_personel_1-departman = 'Said Semih'.
*ls_personel_1-unvan = 'Said Semih'.
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*"İkisi aynı şeyi yapmakta
*DATA: ls_personel_2 TYPE zot_19_s_personel.
*ls_personel_2-id = 'Said Semih'.
*ls_personel_2-ad = 'Said Semih'.
*ls_personel_2-yas = 'Said Semih'.
*ls_personel_2-departman = 'Said Semih'.
*ls_personel_2-unvan = 'Said Semih'.
*ls_personel_2-ekip = VALUE #( (   id = 5 ad = 'Semih' ) ) .
*
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*"biz alttaki olanı kullanıcaz structer kendimiz olusturduk
*""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA: ls_personel    TYPE zot_19_s_personel,
*      lt_personel    TYPE TABLE OF zot_19_s_personel,
*      lt_personel_n  TYPE zot_19_tt_personel,
*      lt_personel_nn TYPE TABLE OF zot_19_tt_personel.
*"38 ve 39 aynıdır
*
*DATA(lt_ekip) = VALUE zot_00_tt_ekip( ( id = 1 ad = 'Fatih' ) ).
*
*lt_personel = VALUE #(
*( id = 1
*  ad = 'Said Semih Yalcin'
*  yas = 18
*  departman = 'ABAP'
*  unvan = 'OneTalent'
*  ekip = lt_ekip
*  )
*  (
*  id = 2
*  ad = 'Mustafa Öz'
*  yas = 19
*  departman = 'ABAP'
*  unvan = 'OneTalent'
*  ekip = VALUE zot_00_tt_ekip( ( id = 3 ad = 'Fatih' ) ( id = 4 ad = 'Hakan' ) )
*  )
*
* ).


BREAK otsyalcin.
