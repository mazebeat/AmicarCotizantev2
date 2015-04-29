//==========================================================================
//   $Workfile:   dux_capi.h  $
//    $Logfile:   W:/src/Mobius/archives/WOLF/DOC1/Host/DuxApi/duxapi/dux_capi.h-arc  $
//
//   Copyright:   Copyright (C) 1993-2009 Pitney Bowes Software Europe Ltd.
//                All Rights Reserved.
//                Source Materials are Pitney Bowes Software Confidential
//
//    Synopsis:   DOC1 User Exit Services (DUX) API for C Language
//
// Description:   DUX provides helper functions to those users
//                writing user exits for use in DOC1 Series 5 (and later).
//
//   Developer:   Jason A. Brown
//     $Author:   g1sjc1  $
//       $Date:   Aug 01 2005 14:24:08  $
//
//   $Revision:   1.12  $
//
//        $Log:   W:/src/Mobius/archives/WOLF/DOC1/Host/DuxApi/duxapi/dux_capi.h-arc  $
//
//   Rev 1.12   Aug 01 2005 14:24:08   g1sjc1
//58267: Getting keyed images user exit working.
//
//   Rev 1.11   Feb 16 2005 08:31:24   g1upc1
//Keyed images - add comments for the parameters of DUXKEYMAPFN
//
//   Rev 1.10   Feb 15 2005 17:17:02   g1upc1
//External Keyed Images/User Exits - multiple out
//
//   Rev 1.9   Feb 10 2005 08:58:18   g1upc1
//Keyed Images - user exits
//
//   Rev 1.8   Jul 18 2004 19:12:50   jab1
//Added some error checking.
//
//   Rev 1.7   Jul 17 2004 20:58:56   jab1
//Added support IBM 1047 code page.
//
//   Rev 1.6   Jul 12 2004 14:44:50   jab1
//Added DuxSetUserData and some tidy up.
//
//   Rev 1.5   Jul 07 2004 20:05:04   jab1
//Added file level user exit support.
//
//   Rev 1.4   Jun 25 2004 09:22:12   ccg1
//AS400 dosen't like returning pointer to constants
//
//   Rev 1.3   Jun 08 2004 12:53:42   jab1
//Tidyed up code and added comments.
//
//   Rev 1.2   Jun 02 2004 20:01:40   jab1
//Fix for building on MVS -- Take 2.
//
//   Rev 1.1   May 26 2004 17:53:32   jab1
//Fixed problem with redundant typedefs breaking MVS build.
//
//   Rev 1.0   May 21 2004 14:21:24   jab1
//Initial revision.
//==========================================================================
#ifndef fDux_capiIncluded
#define fDux_capiIncluded

#if defined (__cplusplus)
extern "C"
{
#endif

//
// This is the contents of this structure is private to DOC1. A handle to
// this structure is passed to the user exit whenever it is called by DOC1.
// This handle must be passed to each helper routine function called.
//
#if !defined(fDuxTypedef)
#define fDuxTypedef
typedef struct tagDUX **HDUX;
#endif

//
// The following data types are used by many of the dux functions.
//
typedef int DUXINT32, *PDUXINT32;                   // 32 bit integer
typedef unsigned int DUXUINT32, *PDUXUINT32;        // 32 bit unsigned integer
typedef unsigned char DUXUINT8, *PDUXUINT8;         // 8 bit byte.
typedef unsigned char DUXBYTE, *PDUXBYTE;           // 8 bit byte.
typedef char DUXCHAR8, *PDUXCHAR8;                  // 8 bit character
typedef const char CDUXCHAR8, *PCDUXCHAR8;          // 8 bit character (const)
typedef unsigned short DUXCHAR16, *PDUXCHAR16;      // 16 bit unicode char.
typedef const unsigned short CDUXCHAR16, *PCDUXCHAR16;// 16 bit unicode char (const).

// The contents of the following types are internal to DOC1.
#if !defined(fDuxDataTypesTypedef)
#define fDuxDataTypesTypedef
typedef struct tagDUXSTRING      *PDUXSTRING;
typedef struct tagDUXNUMBER      *PDUXNUMBER;
typedef struct tagDUXPARENT      *PDUXPARENT;
#endif


// List of return codes.
typedef enum tagDUXRC
{
   DUXRC_OK                = 0,
   DUXRC_Failed            = 1,
   DUXRC_OutOfContext      = 2,
   DUXRC_EndOfData         = 3,
   DUXRC_DataAvailable     = 4,
   DUXRC_BadParameter      = 5,
   DUXRC_InvalidWhole      = 6,
   DUXRC_InvalidFraction   = 7,
   DUXRC_DuplicateName     = 8,
   DUXRC_InvalidName       = 9
}  DUXRC, *PDUXRC;

// List of code page ids.
typedef enum tagDUXCP
{
   DUXCP_Host       =   0, // This is special value meaning whatever host is.
   DUXCP_Win1252    =   1,
   DUXCP_Ibm500     =   2,
   DUXCP_Ibm037     =   3,
   DUXCP_Ibm1025    =   4,
   DUXCP_Ibm1026    =   5,
   DUXCP_Ibm1140    =   6,
   DUXCP_Ibm1141    =   7,
   DUXCP_Ibm1142    =   8,
   DUXCP_Ibm1143    =   9,
   DUXCP_Ibm1144    =  10,
   DUXCP_Ibm1145    =  11,
   DUXCP_Ibm1146    =  12,
   DUXCP_Ibm1147    =  13,
   DUXCP_Ibm1148    =  14,
   DUXCP_Ibm1149    =  15,
   DUXCP_Ibm273     =  16,
   DUXCP_Ibm277     =  17,
   DUXCP_Ibm278     =  18,
   DUXCP_Ibm280     =  19,
   DUXCP_Ibm284     =  20,
   DUXCP_Ibm285     =  21,
   DUXCP_Ibm297     =  22,
   DUXCP_Ibm420     =  23,
   DUXCP_Ibm423     =  24,
   DUXCP_Ibm424     =  25,
   DUXCP_Ibm838     =  26,
   DUXCP_Ibm870     =  27,
   DUXCP_Ibm871     =  28,
   DUXCP_Ibm875     =  29,
   DUXCP_Ibm880     =  30,
   DUXCP_Ibm905     =  31,
   DUXCP_Win1250    =  32,
   DUXCP_Win1251    =  33,
   DUXCP_Win1253    =  34,
   DUXCP_Win1254    =  35,
   DUXCP_Win1255    =  36,
   DUXCP_Win1256    =  37,
   DUXCP_Win1257    =  38,
   DUXCP_Win1258    =  39,
   DUXCP_Win20105   =  40,
   DUXCP_Win20106   =  41,
   DUXCP_Win20107   =  42,
   DUXCP_Win20108   =  43,
   DUXCP_Win20866   =  44,
   DUXCP_Win21866   =  45,
   DUXCP_Win28591   =  46,
   DUXCP_Win28592   =  47,
   DUXCP_Win28593   =  48,
   DUXCP_Win28594   =  49,
   DUXCP_Win28595   =  50,
   DUXCP_Win28596   =  51,
   DUXCP_Win28597   =  52,
   DUXCP_Win28598   =  53,
   DUXCP_Win28599   =  54,
   DUXCP_Win28605   =  55,
   DUXCP_Win38598   =  56,
   DUXCP_Win437     =  57,
   DUXCP_Win708     =  58,
   DUXCP_Win720     =  59,
   DUXCP_Win737     =  60,
   DUXCP_Win775     =  61,
   DUXCP_Win850     =  62,
   DUXCP_Win852     =  63,
   DUXCP_Win855     =  64,
   DUXCP_Win857     =  65,
   DUXCP_Win858     =  66,
   DUXCP_Win860     =  67,
   DUXCP_Win861     =  68,
   DUXCP_Win862     =  69,
   DUXCP_Win863     =  70,
   DUXCP_Win864     =  71,
   DUXCP_Win865     =  72,
   DUXCP_Win866     =  73,
   DUXCP_Win869     =  74,
   DUXCP_Win874     =  75,
   DUXCP_Wolf1148   =  76,
   DUXCP_UTF8       =  87, // DWF SCR 65239 -- add UTF-8 translation 
   DUXCP_Ibm1047    =  120
} DUXCP, *PDUXCP;


typedef enum DUXCALENDER
{
   DUX_Gregorian = 0

} DUXCALENDER, *PDUXCALENDER;

//
// The following defines the actions for data input user exit.
//
typedef enum DUXDATAACTION
{
   DUXDA_VirtualOpen      = 0,
   DUXDA_VirtualClose     = 1,
   DUXDA_IsEndOfData      = 2,
   DUXDA_ReadPublication  = 3
} DUXDATAACTION, *PDUXDATAACTION;

//
// The following are actions for the file user exit.
//
typedef enum DUXFILEACTION
{
   DUXFA_Open        = 100, // Start higher than DUXDATAACTION
   DUXFA_Close       = 101,
   DUXFA_IsEndOfFile = 102,
   DUXFA_Read        = 103,
   DUXFA_Write       = 104,
   DUXFA_Seek        = 105,
   DUXFA_Tell        = 106
} DUXFILEACTION, *PDUXFILEACTION;

//
// The following flags are used for DUX file user exit.
//
#define DUXFF_Read     0x00000001
#define DUXFF_Write    0x00000002
#define DUXFF_Binary   0x00000004
#define DUXFF_Text     0x00000008
#define DUXFF_Stream   0x00000010
#define DUXFF_Record   0x00000020
#define DUXFF_SeekTell 0x00000040

//
// The following flags are used for lookup table user exits.
//
#define DUXLTF_NoCacheResults 0
#define DUXLTF_CacheResults   0x00000001

// List of image type for a External Keyed Images userexit
typedef enum tagDUXIMG
{
   DUXIMG_Any              = 0,
   DUXIMG_TypePSG,
   DUXIMG_TypeFS45,
   DUXIMG_TypeIMG,
   DUXIMG_TypePCL,
   DUXIMG_TypePS,
   DUXIMG_TypeBMP,
   DUXIMG_TypeJPG,
   DUXIMG_TypeGIF,
   DUXIMG_TypeTIF,
   DUXIMG_TypePNG,
   DUXIMG_TypeEPS
}  DUXIMG, *PDUXIMG;

// List of image type for a External Keyed Images userexit
typedef enum tagDUXRESOURCEMODE
{
   DUXRESMODE_Retain = 0,
   DUXRESMODE_ClearAfterUse,
   DUXRESMODE_ClearAfterJob
}  DUXRESOURCEMODE, *PDUXRESOURCEMODE;

//
// DOC1 expects each user exit DLL have an exported function called DOC1REG.
//
//       DUXRC REGISTER (HDUX hdux);
//
// In this function, the user must call one or more DuxRegister... functions
// to register one or more of their user exits.
//
// Note:
//   When DOC1 loads a user exit, it first calls DUXLEVEL and DUXINIT from the
//   DUX module linked in with the user exit. If those calls are successful,
//   DOC1 will then call REGISTER.
//
//   Typically DUXINIT, DUXLEVEL and DUXTERM will automatically be exported.
//   On certain platforms or with certain compilers, it may be necessary for
//   the user to explicitly add DUXLEVEL, DUXINIT and DUXTERM to their export
//   list.  DOC1 will not load the user exit if these functions aren't present.
//

//
// REGISTER SERVICES
//
typedef DUXRC DUXDATAINPUTFN (HDUX, DUXDATAACTION, void*);
typedef DUXDATAINPUTFN *PDUXDATAINPUTFN;
typedef DUXRC DUXFILEFN (HDUX, DUXDATAACTION, void*);
typedef DUXFILEFN *PDUXFILEFN;
typedef DUXRC DUXLOOKUPTABLEFN (HDUX, PDUXSTRING, PDUXSTRING, void*);
typedef DUXLOOKUPTABLEFN *PDUXLOOKUPTABLEFN;
typedef DUXRC DUXJOBSTARTINGFN (HDUX, void*);
typedef DUXJOBSTARTINGFN *PDUXJOBSTARTINGFN;
typedef DUXRC DUXJOBENDINGFN (HDUX, void*);
typedef DUXJOBENDINGFN *PDUXJOBENDINGFN;
typedef DUXRC DUXTERMINATEFN (HDUX, void*);
typedef DUXTERMINATEFN *PDUXTERMINATEFN;
// 58267: Changed interface based upon new information needed...
typedef DUXRC DUXKEYMAPFN (
   HDUX,
   PDUXSTRING, // IN Search string
   PDUXNUMBER, // IN/OUT Sequence id
   PDUXSTRING, // OUT Device anme
   PDUXNUMBER, // OUT Resource Type (bmp, jpg etc....DUXIMG)
   PDUXNUMBER, // OUT embed flag
   PDUXNUMBER, // OUT disposal
   PDUXSTRING, // OUT resource name
   PDUXNUMBER, // OUT Width in pixels
   PDUXNUMBER, // OUT Height in pixels
   PDUXNUMBER, // OUT dpi
   PDUXSTRING, // OUT resource data
   void *);    // IN/OUT User data
typedef DUXKEYMAPFN *PDUXKEYMAPFN;

#if !defined(fDuxInternal)
//
// Data Input User Exit
//
DUXRC DuxRegisterDataInputExit (HDUX hdux, PDUXSTRING pstrName, PDUXDATAINPUTFN pfn, void* pvUser);

//
// Lookup Table User Exit
//
DUXRC DuxRegisterLookupTableExit (HDUX hdux, PDUXSTRING pstrName, DUXUINT32 flFlags, PDUXLOOKUPTABLEFN pfn, void* pvUser);

//
// File User Exits
//
DUXRC DuxRegisterFileInputExit (HDUX hdux, PDUXSTRING pstrName, DUXUINT32 flFlags, PDUXFILEFN pfn, void* pvUser);
DUXRC DuxRegisterFileOutputExit (HDUX hdux, PDUXSTRING pstrName, DUXUINT32 flFlags, PDUXFILEFN pfn, void* pvUser);
//
// KeyMap User Exit
//
DUXRC DuxRegisterKeyMapExit (HDUX hdux, PDUXSTRING pstrName, DUXUINT32 flFlags, PDUXKEYMAPFN pfn, void* pvUser);

//
// Function will be called when DOC1 starts job.
//
DUXRC DuxRegisterJobStartingEvent (HDUX hdux, PDUXJOBSTARTINGFN pfn, void* pvUser);

//
// Function will be called when DOC1 ends job.
//
DUXRC DuxRegisterJobEndingEvent (HDUX hdux, PDUXJOBENDINGFN pfn, void* pvUser);

//
// Function will be called just before user exit DLL is unloaded.
//
DUXRC DuxRegisterTerminateEvent (HDUX hdux, PDUXTERMINATEFN pfn, void* pvUser);

//
// CODE PAGE SERVICES
//
// Internally DOC1 stores all strings as Unicode. However, many
// programmers are not familar with Unicode and the full benefits
// of its use is not typically required.
//
// Instead of making all users learn Unicode, DUX provides
// an interface for supports non-Unicode strings.  The default
// code page used for this is whatever the code page on the
// host environment is when the user exit is run.
// However, the user can override it with DuxSetCodePage.
//
DUXCP DuxGetCodePage (HDUX hdux);
void DuxSetCodePage (HDUX hdux, DUXCP id);
void DuxStrChangeCodePage (HDUX hdux, PDUXSTRING pstr, DUXCP id);

//
// STRING SERVICES
//
PDUXSTRING DuxStrAlloc (HDUX hdux);
PDUXSTRING DuxStrAllocWithString (HDUX hdux, PCDUXCHAR8 psz);
PDUXSTRING DuxStrAllocWithString16 (HDUX hdux, PCDUXCHAR16 psz);
PDUXSTRING DuxStrFree (HDUX hdux, PDUXSTRING pstr);

// These are non unicode version of functions. Depending on
// the code page, they are single byte or mixed byte code pages.
void DuxStrSetCharLength (HDUX hdux, PDUXSTRING pstr, DUXUINT32 cch);
DUXINT32 DuxStrGetCharLength (HDUX hdux, PDUXSTRING pstr);

PDUXCHAR8 DuxStrGetChars (HDUX hdux, PDUXSTRING pstr);
void DuxStrSetChars (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR8 pch, DUXUINT32 cch);
void DuxStrSetString (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR8 psz);
PDUXCHAR8 DuxStrGetCharsForCp (HDUX hdux, PDUXSTRING pstr, DUXCP idCp);
void DuxStrSetCharsForCp (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR8 pch, DUXUINT32 cch, DUXCP idCp);
void DuxStrSetStringForCp (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR8 psz, DUXCP idCp);

// These are unicode versions of the string functions.
void DuxStrSetChar16Length (HDUX hdux, PDUXSTRING pstr, DUXUINT32 cch);
DUXINT32 DuxStrGetChar16Length (HDUX hdux, PDUXSTRING pstr);

PDUXCHAR16 DuxStrGetChars16 (HDUX hdux, PDUXSTRING pstr);
void DuxStrSetChars16 (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR16 pch, DUXUINT32 cch);
void DuxStrSetString16 (HDUX hdux, PDUXSTRING pstr, PCDUXCHAR16 psz);

//
// NUMBER/CURRENCY SERVICES
//
PDUXNUMBER DuxNumAlloc (HDUX hdux);
PDUXNUMBER DuxNumFree (HDUX hdux, PDUXNUMBER pnum);
DUXRC      DuxNumStore (HDUX hdux, PDUXNUMBER pnum, PDUXSTRING pstrWhole, PDUXSTRING pszFraction);
DUXINT32  DuxNumToINT (HDUX hdux, PDUXNUMBER pnum);
VOID  DuxNumFromINT (HDUX hdux, PDUXNUMBER pnum, DUXINT32 pint);
DUXUINT32 DuxNumToUINT (HDUX hdux, PDUXNUMBER pnum);
VOID DuxNumFromUINT (HDUX hdux, PDUXNUMBER pnum, DUXUINT32 puint);

//
// CONFIGURATION SERVICES
//
DUXRC DuxGetOpsSymbolValue (HDUX hdux, PDUXSTRING pstrName, PDUXSTRING pstrValue, PDUXSTRING pstrDefault);
DUXUINT32 DuxGetInvokeParameterCount (HDUX hdux);
DUXRC DuxGetInvokeParameter (HDUX hdux, PDUXSTRING pstr, DUXUINT32 nParam);
DUXRC DuxSetUserData (HDUX hdux, void *pvUser);

//
// EXCEPTION SERVICES
//
void DuxInformUser (HDUX hdux, PDUXSTRING pstrMsg);
void DuxRaiseWarning (HDUX hdux, PDUXSTRING pstrMsg);
void DuxStopJob (HDUX hdux, PDUXSTRING pstrMsg);
void DuxAbortPublication (HDUX hdux, PDUXSTRING pstrMsg);

//
// DATA INPUT SERVICES
//
PDUXPARENT DuxAddRecord (HDUX hdux, PDUXPARENT pParent, PDUXSTRING pstrKey);
DUXRC DuxAddStringField (HDUX hdux, PDUXPARENT pParent, PDUXSTRING pstrName, PDUXSTRING pstrVal);
DUXRC DuxAddCounterField (HDUX hdux, PDUXPARENT pParent, PDUXSTRING pstrName, DUXUINT32 nVal);
DUXRC DuxAddNumberField (HDUX hdux, PDUXPARENT pParent, PDUXSTRING pstrName, PDUXNUMBER pnumVal);
DUXRC DuxAddDateField (HDUX hdux, PDUXPARENT pParent, PDUXSTRING pstrName, DUXUINT32 nDay, DUXUINT32 nMonth, DUXUINT32 nYear, DUXCALENDER cal);

//
// FILE SERVICES
//
DUXRC    DuxSetFileByteData (HDUX hdux, PDUXBYTE pbData, DUXUINT32 cbData);
DUXRC    DuxSetFileStringData (HDUX hdux, PDUXSTRING pstr);
DUXRC    DuxSetFileByteDataSize(HDUX hdux, DUXUINT32 cbData);
DUXINT32 DuxGetFileByteDataSize (HDUX hdux);
PDUXBYTE DuxGetFileByteBuffer (HDUX hdux);
DUXRC    DuxGetFileStringData (HDUX hdux, PDUXSTRING pstr);
DUXRC    DuxGetFileOffset (HDUX hdux, PDUXUINT32 pofs);
DUXRC    DuxSetFileOffset (HDUX hdux, DUXUINT32 ofs);
DUXRC    DuxGetFileOpenMode (HDUX hdux, PDUXUINT32 pnFlags);

//
// DEBUG SERVICES
//
DUXRC DuxDbgGetReturnCodeText (HDUX hdux, DUXRC rc, PDUXSTRING pstr);


#endif // !defined(fDuxInternal)

#if defined (__cplusplus)
}
#endif

#endif // !fDux_capiIncluded


