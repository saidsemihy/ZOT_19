*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZSSY_T_URUNAD...................................*
DATA:  BEGIN OF STATUS_ZSSY_T_URUNAD                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSSY_T_URUNAD                 .
CONTROLS: TCTRL_ZSSY_T_URUNAD
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZSSY_T_URUNAD                 .
TABLES: ZSSY_T_URUNAD                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
