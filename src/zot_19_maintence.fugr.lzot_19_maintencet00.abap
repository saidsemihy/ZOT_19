*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_19_T_KONUM..................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_KONUM                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_KONUM                .
CONTROLS: TCTRL_ZOT_19_T_KONUM
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_19_T_PERS...................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_PERS                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_PERS                 .
CONTROLS: TCTRL_ZOT_19_T_PERS
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_19_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_AILE               .
CONTROLS: TCTRL_ZOT_19_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0007'.
*...processing: ZOT_19_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_ATUR               .
CONTROLS: TCTRL_ZOT_19_T_P_ATUR
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: ZOT_19_T_P_EGTM.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_EGTM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_EGTM               .
CONTROLS: TCTRL_ZOT_19_T_P_EGTM
            TYPE TABLEVIEW USING SCREEN '0008'.
*...processing: ZOT_19_T_P_ETUR.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_ETUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_ETUR               .
CONTROLS: TCTRL_ZOT_19_T_P_ETUR
            TYPE TABLEVIEW USING SCREEN '0009'.
*...processing: ZOT_19_T_P_ILTSM................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_ILTSM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_ILTSM              .
CONTROLS: TCTRL_ZOT_19_T_P_ILTSM
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_19_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_19_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_19_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_MAST               .
CONTROLS: TCTRL_ZOT_19_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_19_T_P_TWITT................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_P_TWITT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_P_TWITT              .
CONTROLS: TCTRL_ZOT_19_T_P_TWITT
            TYPE TABLEVIEW USING SCREEN '0010'.
*...processing: ZOT_19_T_TIME...................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_TIME                 .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_TIME                 .
CONTROLS: TCTRL_ZOT_19_T_TIME
            TYPE TABLEVIEW USING SCREEN '0012'.
*...processing: ZOT_19_T_TWITTER................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_TWITTER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_TWITTER              .
CONTROLS: TCTRL_ZOT_19_T_TWITTER
            TYPE TABLEVIEW USING SCREEN '0011'.
*...processing: ZOT_19_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_19_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_19_T_ZMN                  .
CONTROLS: TCTRL_ZOT_19_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0013'.
*.........table declarations:.................................*
TABLES: *ZOT_19_T_KONUM                .
TABLES: *ZOT_19_T_PERS                 .
TABLES: *ZOT_19_T_P_AILE               .
TABLES: *ZOT_19_T_P_ATUR               .
TABLES: *ZOT_19_T_P_EGTM               .
TABLES: *ZOT_19_T_P_ETUR               .
TABLES: *ZOT_19_T_P_ILTSM              .
TABLES: *ZOT_19_T_P_ITUR               .
TABLES: *ZOT_19_T_P_MAST               .
TABLES: *ZOT_19_T_P_TWITT              .
TABLES: *ZOT_19_T_TIME                 .
TABLES: *ZOT_19_T_TWITTER              .
TABLES: *ZOT_19_T_ZMN                  .
TABLES: ZOT_19_T_KONUM                 .
TABLES: ZOT_19_T_PERS                  .
TABLES: ZOT_19_T_P_AILE                .
TABLES: ZOT_19_T_P_ATUR                .
TABLES: ZOT_19_T_P_EGTM                .
TABLES: ZOT_19_T_P_ETUR                .
TABLES: ZOT_19_T_P_ILTSM               .
TABLES: ZOT_19_T_P_ITUR                .
TABLES: ZOT_19_T_P_MAST                .
TABLES: ZOT_19_T_P_TWITT               .
TABLES: ZOT_19_T_TIME                  .
TABLES: ZOT_19_T_TWITTER               .
TABLES: ZOT_19_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
