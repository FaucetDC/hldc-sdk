// injectProcess.h : main header file for the INJECTPROCESS application
//

#if !defined(AFX_INJECTPROCESS_H__AF432E1C_1093_47AF_85F6_C32C86432EAB__INCLUDED_)
#define AFX_INJECTPROCESS_H__AF432E1C_1093_47AF_85F6_C32C86432EAB__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CInjectProcessApp:
// See injectProcess.cpp for the implementation of this class
//

class CInjectProcessApp : public CWinApp
{
public:
	CInjectProcessApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInjectProcessApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CInjectProcessApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft eMbedded Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_INJECTPROCESS_H__AF432E1C_1093_47AF_85F6_C32C86432EAB__INCLUDED_)
