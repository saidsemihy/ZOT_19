*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZSSY_T_URUNAD
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZSSY_T_URUNAD      .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
