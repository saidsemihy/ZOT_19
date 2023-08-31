*&---------------------------------------------------------------------*
*& Report zot_19_p_readtable
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_19_p_readtable.

DATA: gt_scarr TYPE TABLE OF scarr,
      gs_scarr TYPE scarr.

START-OF-SELECTION.

  SELECT * FROM scarr
      INTO TABLE gt_scarr.

*  READ TABLE gt_scarr INTO gs_scarr INDEX 4.

  WRITE: gs_scarr.

*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrid = 'AZ'.

*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrname = 'Alitalia'.

*  READ TABLE gt_scarr INTO gs_scarr WITH KEY carrname = 'Alitalia'
*                                             currcode = 'EUR'.
*
*
loop at gt_scarr into gs_scarr where currcode = 'EUR'.

WRITE: gs_scarr.
ENDLOOP.

*read table gt_scarr into gs_scarr WITH KEY currcode = 'EUR'.
*break otsyalcin.
