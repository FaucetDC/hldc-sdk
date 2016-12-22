// mydll.cpp : Defines the initialization routines for the DLL.
//

#include "stdafx.h"
#include "mydll.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

static WNDPROC g_pOldWndProc = NULL;
LRESULT EditTopmostProc(HWND hWnd, UINT uMsgs, WPARAM wParam, LPARAM lParam);

//
//	Note!
//
//		If this DLL is dynamically linked against the MFC
//		DLLs, any functions exported from this DLL which
//		call into MFC must have the AFX_MANAGE_STATE macro
//		added at the very beginning of the function.
//
//		For example:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// normal function body here
//		}
//
//		It is very important that this macro appear in each
//		function, prior to any calls into MFC.  This means that
//		it must appear as the first statement within the 
//		function, even before any object variable declarations
//		as their constructors may generate calls into the MFC
//		DLL.
//
//		Please see MFC Technical Notes 33 and 58 for additional
//		details.
//

/////////////////////////////////////////////////////////////////////////////
// CMydllApp

BEGIN_MESSAGE_MAP(CMydllApp, CWinApp)
	//{{AFX_MSG_MAP(CMydllApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMydllApp construction

CMydllApp::CMydllApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CMydllApp object

CMydllApp theApp;
__declspec(dllexport) void SubClassEdit(HWND m_editHandle)
{
	g_pOldWndProc = (WNDPROC)GetWindowLong(m_editHandle, GWL_WNDPROC);
	SetWindowLong(m_editHandle, GWL_WNDPROC, (LONG)EditTopmostProc);
	

	
}
TCHAR buffer[1025];
LRESULT EditTopmostProc(HWND hWnd, UINT uMsgs, WPARAM wParam, LPARAM lParam)
{
		if ( uMsgs == WM_KILLFOCUS )
		{
			GetWindowText(hWnd,buffer,1025);
			MessageBox(hWnd,buffer,L"you saved",MB_OK);
			/******************************************************************/
			 return CallWindowProc(g_pOldWndProc, hWnd, uMsgs, wParam, lParam); //Info
		}
		 return CallWindowProc(g_pOldWndProc, hWnd, uMsgs, wParam, lParam); //Info
}