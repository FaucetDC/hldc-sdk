// injectProcessDlg.h : header file
//

#if !defined(AFX_INJECTPROCESSDLG_H__DC7134DA_AE95_43F9_AF33_0BD4EA8D5A6B__INCLUDED_)
#define AFX_INJECTPROCESSDLG_H__DC7134DA_AE95_43F9_AF33_0BD4EA8D5A6B__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000

/////////////////////////////////////////////////////////////////////////////
// CInjectProcessDlg dialog

class CInjectProcessDlg : public CDialog
{
// Construction
public:
	CInjectProcessDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CInjectProcessDlg)
	enum { IDD = IDD_INJECTPROCESS_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInjectProcessDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CInjectProcessDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft eMbedded Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_INJECTPROCESSDLG_H__DC7134DA_AE95_43F9_AF33_0BD4EA8D5A6B__INCLUDED_)
