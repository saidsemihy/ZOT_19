*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZOT_19_MAINTENCE
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZOT_19_MAINTENCE   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
