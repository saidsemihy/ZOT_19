*&---------------------------------------------------------------------*
*& Report ZOT_19_P_SQL_CORRESPONDING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZOT_19_P_SQL_CORRESPONDING.

data: gt_scarr type table of scarr,
      gt_scarr2 type table of scarr.

START-OF-SELECTION.

select carrname url from scarr into table gt_scarr.
select carrname url from scarr into CORRESPONDING FIELDS OF table gt_scarr2.

BREAK-POINT.
