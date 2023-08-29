*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZSSY_T_URUN.....................................*
DATA:  BEGIN OF STATUS_ZSSY_T_URUN                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSSY_T_URUN                   .
CONTROLS: TCTRL_ZSSY_T_URUN
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZSSY_T_URUN                   .
TABLES: *ZSSY_T_URUNAD                 .
TABLES: ZSSY_T_URUN                    .
TABLES: ZSSY_T_URUNAD                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
