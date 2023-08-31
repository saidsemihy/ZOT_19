*&---------------------------------------------------------------------*
*& Report zot_19_p_mail_gonder
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_mail_gonder.

INCLUDE zot_19_p_mail_top.
INCLUDE zot_19_p_mail_sls.
INCLUDE zot_19_p_mail_cls.


INITIALIZATION.
  go_main = lcl_main=>get_instance( ).


START-OF-SELECTION.
  go_main->start_of_selection( ).
