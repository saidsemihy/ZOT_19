*&---------------------------------------------------------------------*
*& Report zot_19_p_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_report.
"SAT NO ......  ebeln,
"Belge Türü.... bsart,

"SAS No...
"Belge Türü

"*
"*
"-> bastığında sırasıyla gösterebilin

"SAT -> SAT no, SAT kalem no, SAT belge türü, SAT malzeme, Talep miktarı, Ölçü birimi
"SAS -> SAS no, SAS kalem no, SAS malzeme, SAS miktarı, ölçü birimi

"SAT ->eban (ebeln,bsart)
"SAS ->ekpo
INCLUDE zot_19_p_report_top.


INCLUDE zot_19_p_report_pbo.

INCLUDE zot_19_p_report_pai.

INCLUDE zot_19_p_report_frm.

START-OF-SELECTION.

PERFORM get_data.

PERFORM set_fcat.

PERFORM set_layout.

CALL SCREEN 0100.
