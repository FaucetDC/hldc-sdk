// mydll.h : main header file for the MYDLL DLL
//

#if !defined(AFX_MYDLL_H__31F668AF_0EA4_4A7A_B95C_4A969394DDD9__INCLUDED_)
#define AFX_MYDLL_H__31F668AF_0EA4_4A7A_B95C_4A969394DDD9__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CMydllApp
// See mydll.cpp for the implementation of this class
//

class CMydllApp : public CWinApp
{
public:
	CMydllApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMydllApp)
	//}}AFX_VIRTUAL

	//{{AFX_MSG(CMydllApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft eMbedded Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MYDLL_H__31F668AF_0EA4_4A7A_B95C_4A969394DDD9__INCLUDED_)
