*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZSSY_T_URUNARA..................................*
DATA:  BEGIN OF STATUS_ZSSY_T_URUNARA                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSSY_T_URUNARA                .
CONTROLS: TCTRL_ZSSY_T_URUNARA
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZSSY_T_URUNARA                .
TABLES: ZSSY_T_URUNARA                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
