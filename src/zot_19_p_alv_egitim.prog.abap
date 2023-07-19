*&---------------------------------------------------------------------*
*& Report zot_19_p_alv_egitim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_alv_egitim.

data: gt_sbook type table of sbook,
      go_salv type ref to cl_salv_table.

START-OF-SELECTION.

select * up to 20 rows from sbook
    into table gt_sbook.

    cl_salv_table=>factory(
      IMPORTING
        r_salv_table   = go_salv

      CHANGING
        t_table        = gt_sbook
    ).


 go_salv->display(  ).
