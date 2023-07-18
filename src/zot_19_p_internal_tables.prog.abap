*&---------------------------------------------------------------------*
*& Report zot_19_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_internal_tables.

" 1-) zot_00_t_materia tipinde tablo oluşturduk
DATA: lt_table TYPE TABLE OF zot_00_t_materia.
DATA: lt_table_new TYPE TABLE OF zot_00_t_materia.


START-OF-SELECTION.
" 2-) Tablodan verileri çektik
SELECT *
INTO TABLE lt_table
FROM zot_00_t_materia.

" 3-) matnr uniq olacak şekilde 5 veri ekledik
lt_table_new = VALUE #( BASE lt_table_new   (
                                               matnr = '1'
                                               maktx = 'Tornavida'
                                               matkl = 'C'
                                               menge = '1'
                                               meins = 'ST')
                                              (
                                               matnr = '2'
                                               maktx = 'Pense'
                                               matkl = 'C'
                                               menge = '2'
                                               meins = 'ST')
                                               (
                                               matnr = '3'
                                               maktx = 'Keser'
                                               matkl = 'C'
                                               menge = '3'
                                               meins = 'ST')
                                               (
                                               matnr = '4'
                                               maktx = 'Ingiliz Anahtari'
                                               matkl = 'C'
                                               menge = '0'
                                               meins = 'ST')
                                               (
                                               matnr = '5'
                                               maktx = 'Fırca'
                                               matkl = 'C'
                                               menge = '3'
                                               meins = 'ST')
                                               ).


" 4-) ölçü birimi eşleşenlerin menge alanına 10 ekledik
  LOOP AT lt_table INTO DATA(ls_table).
    READ TABLE lt_table_new INTO DATA(ls_table_new) WITH KEY meins = ls_table-meins.
    IF sy-subrc EQ 0.
      ls_table-menge = ls_table-menge + 10.
      MODIFY lt_table FROM ls_table.
    ENDIF.
  ENDLOOP.

" 5-) tabloları yeni bir internal tablosunda birleştirdik.
  DATA lt_table_new2 TYPE TABLE OF zot_00_t_materia.

  APPEND LINES OF lt_table TO lt_table_new2.
  APPEND LINES OF lt_table_new TO lt_table_new2.

" 6-) yeni bir type oluşturup bu tipten internal table oluşturduk.
  TYPES: BEGIN OF lty_malzeme,
           matkl TYPE matkl,
           menge TYPE menge_d,
         END OF lty_malzeme.
  DATA: lt_malzeme_collect TYPE TABLE OF lty_malzeme.
  DATA: ls_malzeme_collect TYPE  lty_malzeme.

" malzeme gruplarının menge alanlarının toplamını bu internal table'de ekledik.
  LOOP AT lt_table_new2 INTO DATA(ls_table_new2).
    ls_malzeme_collect = VALUE #( matkl = ls_table_new2-matkl
                                  menge = ls_table_new2-menge ).
    COLLECT ls_malzeme_collect INTO lt_malzeme_collect.
  ENDLOOP.
" 7-) menge alanı 10'dan küçük olanları birleştirdiğimiz internal tableden sildik
  DELETE lt_malzeme_collect WHERE menge < 10.

" 8-) menge alanı küçükten büyüğe, malzeme gruplarını topladığımız internal table'ı menge alanı
"büyükten küçüğe sıralayıp ekrana yazdırdık
  SORT lt_table_new2 ASCENDING BY menge.
  SORT lt_malzeme_collect DESCENDING BY menge.

  cl_demo_output=>display( lt_table_new2 ).
  cl_demo_output=>display( lt_malzeme_collect ).

END-OF-SELECTION.

  BREAK-POINT.
