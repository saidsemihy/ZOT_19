*&---------------------------------------------------------------------*
*& Report zot_19_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_sip_kirilim.
TABLES: vbap, vbak.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_val1 TYPE i OBLIGATORY,
              p_val2 TYPE i OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS: s_sipno FOR vbak-vbeln,
                  s_sipvrn FOR vbak-kunnr,
                  s_siptur FOR vbak-auart,
                  s_blgtrh FOR vbak-audat.
SELECTION-SCREEN END OF BLOCK a1.

SELECTION-SCREEN BEGIN OF BLOCK a2 WITH FRAME TITLE TEXT-002.

  SELECT-OPTIONS: s_malzme FOR vbap-matnr ,
                  s_urtyer FOR vbap-werks,
                  s_kaltip FOR vbap-pstyv,
                  s_malgr FOR vbap-matkl,
                  s_charg FOR vbap-charg.
SELECTION-SCREEN END OF BLOCK a2.

DATA: lv_count TYPE string.


PARAMETERS: check1 AS CHECKBOX, "sipariş türü
            check2 AS CHECKBOX, "malzeme no
            check3 AS CHECKBOX, "sipariş veren
            check4 AS CHECKBOX, "mal grubu
            check5 AS CHECKBOX. "parti
IF check1 EQ abap_true.
  lv_count += 1.
ENDIF.
IF check2 EQ abap_true.
  lv_count += 1.
ENDIF.
IF check3 EQ abap_true.
  lv_count += 1.
ENDIF.
IF check4 EQ abap_true.
  lv_count += 1.
ENDIF.
IF check5 EQ abap_true.
  lv_count += 1.
ENDIF.
IF lv_count > 2.
  MESSAGE '2 den fazla kırılma noktası seçilemez! ' TYPE 'I'.
ELSEIF lv_count < 2.
  MESSAGE 'Lütfen 2 tane kırılma noktası seçiniz! ' TYPE 'I'.
ENDIF.

TYPES: BEGIN OF gty_table,
         vbeln TYPE vbeln_va,
         kunnr TYPE kunag,
         auart TYPE auart,
         audat TYPE audat,
         matnr TYPE matnr,
         werks TYPE werks_ext,
         pstyv TYPE pstyv,
         charg TYPE charg_d,
         netwr TYPE netwr_ap,
         waerk TYPE waerk,
       END OF gty_table.

DATA lt_table TYPE TABLE OF gty_table.
SELECT vbak~vbeln, vbak~kunnr, vbak~auart, vbak~audat,
vbap~matnr, vbap~werks, vbap~pstyv, vbap~charg, vbap~netwr,vbap~waerk  FROM vbak INNER JOIN vbap ON vbak~vbeln = vbap~vbeln INTO TABLE @lt_table.
FIELD-SYMBOLS: <lt_table_2> TYPE STANDARD TABLE,
               <ls_dyntable> type any.

*call METHOD cl_alv_table_create=>create_dynamic_table
*  EXPORTING
*    it_fieldcatalog           =
*  IMPORTING
*    ep_table                  =
*  .
IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.

IF check1 EQ abap_true AND check2 EQ abap_true.
  TYPES: BEGIN OF lty_1,
           auart TYPE auart,
           matnr TYPE matnr,
           netwr TYPE netwr_ap,
         END OF lty_1.
  DATA lt_tur_no TYPE TABLE OF lty_1.
  ASSIGN lt_tur_no TO <lt_table_2>.

  SELECT t2~auart, t1~matnr, SUM( t1~netwr ) AS deger
  FROM vbak AS t2 JOIN vbap AS t1 ON t2~vbeln = t1~vbeln
  WHERE t2~vbeln IN @s_sipno AND t2~kunnr IN @s_sipvrn
  AND t2~auart IN @s_siptur AND t2~audat IN @s_blgtrh
  AND t1~matnr IN @s_malzme AND t1~werks IN @s_urtyer
  AND t1~pstyv IN @s_kaltip AND t1~matkl IN @s_malgr AND t1~charg IN @s_charg
  GROUP BY t1~matnr, t2~auart INTO TABLE @<lt_table_2>.
ENDIF.


cl_demo_output=>display( <lt_table_2> ).
*break otsyalcin.
