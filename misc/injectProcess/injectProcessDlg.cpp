// injectProcessDlg.cpp : implementation file
//

#include "stdafx.h"
#include "injectProcess.h"
#include "injectProcessDlg.h"
#include "CoreSys.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif
static LPCTSTR szApplication =TEXT("notes.exe");

/////////////////////////////////////////////////////////////////////////////
// CInjectProcessDlg dialog

CInjectProcessDlg::CInjectProcessDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CInjectProcessDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CInjectProcessDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CInjectProcessDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CInjectProcessDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CInjectProcessDlg, CDialog)
	//{{AFX_MSG_MAP(CInjectProcessDlg)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInjectProcessDlg message handlers

BOOL CInjectProcessDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen


	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}



void CInjectProcessDlg::OnButton1() 
{

	PROCESS_INFORMATION pi;
	BOOL bMode = SetKMode(TRUE);
	DWORD dwPerm = SetProcPermissions(0xFFFFFFFF);/*to set ur application in kernal omde
												  and have access to other process
												  */

	CreateProcess(szApplication,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,&pi);//excute note process
	Sleep(3000);
	HANDLE hProcess=GetProcessHandle(L"notes.exe");//get handle
	if (hProcess)
	{
		/***************************************************************************
		now i will put my dll into present perocess and you can 
		function inside this dll
		**************************************************************************/
		CALLBACKINFO cbi;
		cbi.hProc = hProcess;
		cbi.pfn = (FARPROC)MapPtrToProcess(GetProcAddress(GetModuleHandle(L"COREDLL"), L"LoadLibraryW"), hProcess);
		cbi.pvArg0 = (LPVOID)MapPtrToProcess(L"\\windows\\mydll.dll", GetCurrentProcess());
		HINSTANCE hInst = (HINSTANCE)PerformCallBack4(&cbi, 0,0,0);

		/***********to execute your function *********************/
		Sleep(1000);
		HWND m_hWnd=::GetForegroundWindow();//handle for note
		m_hWnd=::GetWindow(m_hWnd,GW_CHILD);//handle for InkX
		m_hWnd=::GetWindow(m_hWnd,GW_CHILD);//handle for richink
		cbi.hProc = hProcess;
		cbi.pfn = (FARPROC)MapPtrToProcess(GetProcAddress(hInst, L"SubClassEdit"), hProcess);//my function inside dll
		cbi.pvArg0 = m_hWnd;
		hInst = (HINSTANCE)PerformCallBack4(&cbi, 0,0,0);




		
	}
	
	
}
