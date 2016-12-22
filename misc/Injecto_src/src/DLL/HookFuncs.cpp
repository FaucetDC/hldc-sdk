#include <windows.h>
//#include <HookAPI.h>
#include <iostream>
#include <cstdio>
#include <string>
#define Append(text) AppendLog(text, strlen(text))

using namespace std;

PROC WINAPI HookImportedFunction(
        HMODULE hFromModule,        // Module to intercept calls from
        PSTR    pszFunctionModule,  // Module to intercept calls to
        PSTR    pszFunctionName,    // Function to intercept calls to
        PROC    pfnNewProc          // New function (replaces old function)
        );

	extern BOOL IsLogging;
	extern HANDLE hLogFile;

	HANDLE OpenLog(char *Filename);
	BOOL CloseLog(HANDLE h=hLogFile);
	DWORD AppendLog(char *str, DWORD uSize, HANDLE h=hLogFile);


	BOOL Hooked=false;



//////
	////

	typedef int(WINAPI *SENDPROC)(SOCKET, const char FAR*, int, int); //SENDPROC
	typedef int(WINAPI *RECVPROC)(SOCKET, char FAR *, int, int);	 //RECVPROC
	typedef int(WINAPI *BINDPROC)(SOCKET, const struct sockaddr FAR *, int); //BINDPROC
	typedef int(WINAPI *CLOSESOCKETPROC)(SOCKET); //CLOSESOCKETPROC
	typedef int(WINAPI *CONNECTPROC)(SOCKET, const struct sockaddr FAR *, int); //CONNECTPROC
	typedef int(WINAPI *LISTENPROC)(SOCKET, int); //LISTENPROC
	typedef SOCKET(WINAPI *ACCEPTPROC)(SOCKET, struct sockaddr FAR *, int FAR *); //ACCEPTPROC
	typedef SOCKET(WINAPI *SOCKETPROC)(int, int, int); //SOCKETPROC
	
	typedef int(WINAPI *WSAGetLastErrorProc)(void); //WSAGetLastErrorProc

	////
//////


	//
	///////////////////////////////////////////
	//
		SENDPROC			Osend;
		RECVPROC			Orecv;
		ACCEPTPROC			Oaccept;
		BINDPROC			Obind;
		CLOSESOCKETPROC		Oclosesocket;
		CONNECTPROC			Oconnect;
		LISTENPROC			Olisten;
		SOCKETPROC			Osocket;
		WSAGetLastErrorProc	OWSAGetLastError;

	//
	///////////////////////////////////////////
	//
		int	WINAPI		_send
								(SOCKET s, const char FAR *buf, int len, int flags );
		int	WINAPI		_recv
								(SOCKET s, char FAR *buf, int len, int flags);
		int	WINAPI		_listen
								(SOCKET s, int backlog );
		SOCKET WINAPI	_accept
								(SOCKET s, struct sockaddr FAR *addr, int FAR *addrlen);
		int WINAPI		_bind
								(SOCKET s, const struct sockaddr FAR *name, int namelen);
		int WINAPI		_closesocket
								(SOCKET s);
		int WINAPI		_connect
								(SOCKET s, const struct sockaddr FAR *name, int namelen);
		SOCKET WINAPI	_socket
								(int af, int type, int protocol);
	//
	//////////////////////////////////////////
	//


//============================
//  Hook functions:
//

#define WinsockDll "WSock32.dll"
#define Hook(dllfuncname, proc) HookImportedFunction(GetModuleHandle(0), WinsockDll, dllfuncname, (PROC)proc)
#define IfCantHook(returnV, cast, dllfuncname, proc) if( (returnV = (cast)Hook(dllfuncname, (PROC)proc))==0 )
#define CheckForHook if(!Hooked) return
#define SendCheck Append("error"); else Append("OK")


int HookWinsockProcs()
{
	Hooked=false;

	Append("Hooking...");

	Append("\r\n\tsocket() -> ");
	IfCantHook(Osocket, SOCKETPROC, "socket", _socket)
		SendCheck;

	Append("\r\n\tsend() -> ");
	IfCantHook(Osend, SENDPROC, "send", _send)
		SendCheck;
		
	Append("\r\n\trecv() ->");
	IfCantHook(Orecv, RECVPROC, "recv", _recv)
		SendCheck;

	Append("\r\n\tlisten() -> ");
	IfCantHook(Olisten, LISTENPROC, "listen", _listen)
		SendCheck;

	Append("\r\n\taccept() -> ");
	IfCantHook(Oaccept, ACCEPTPROC, "accept", _accept)
		SendCheck;

	Append("\r\n\tbind() -> ");
	IfCantHook(Obind, BINDPROC, "bind", _bind)
		SendCheck;

	Append("\r\n\tclosesocket() -> ");
	IfCantHook(Oclosesocket, CLOSESOCKETPROC, "closesocket", _closesocket)
		SendCheck;

	Append("\r\n\tconnect() -> ");
	IfCantHook(Oconnect, CONNECTPROC, "connect", _connect)
		SendCheck;

	Append("\r\nWSAGetLastError() ->");
	OWSAGetLastError = GetProcAddress(GetModuleHandle(WinsockDll), "WSAGetLastError");
	if(OWSAGetLastError==0)
		SendCheck;

	Append("\r\n\r\n");

	Hooked = true;
	return 0;
}//end function HookWinsockProcs()

//
//
//==================================================




int WINAPI _send(SOCKET s, const char FAR *buff, int len, int flags )
{
/////////////////////////
	char buf[1024];
	int ret = Osend(s, buff, len, flags);
	
	sprintf(buf, "send(SOCKET=%d, size=%d) - ret=%d \r\n{", s, len, ret);
	Append(buf);
	AppendLog((char*)buff, len);
	Append("}\r\n");
	
	return ret;
}
	
int	WINAPI _recv(SOCKET s, char FAR *buff, int len, int flags)
{
	char buf[1024];
	int ret = Orecv(s, buff, len, flags);
	int gle;

	if(ret==-1)//SOCKET_ERROR
	{
		if(OWSAGetLastError!=0)
		{
			gle = OWSAGetLastError();
			if(gle==WSAEWOULDBLOCK)
				sprintf(buf, "recv(SOCKET=%d, size=%d) - No data in queue (nonblocking socket)\r\n", s, len, ret);
			else
				sprintf(buf, "recv(SOCKET=%d, size=%d) - ret=%d - SOCKET_ERROR - WSAGetLastError=%d\r\n", s, len, ret, gle);
		} else
			sprintf(buf, "recv(SOCKET=%d, size=%d) - ret=%d - SOCKET_ERROR - WSAGetLastError=???\r\n", s, len, ret);

			Append(buf);

	}else if(ret==0)
	{
		sprintf(buf, "recv(SOCKET=%d, size=%d) - ret=%d If the connection has been gracefully closed!\r\n", s, len, ret);
		Append(buf);		
	}else
	{
		sprintf(buf, "recv(SOCKET=%d, size=%d) - ret=%d(bytes recv'ed) \r\n{", s, len, ret);
		Append(buf);
		AppendLog(buff, ret);
		Append("}\r\n");
	}
	
	return ret;
}

int	WINAPI _listen(SOCKET s, int backlog )
{
	char buf[1024];
	int ret = Olisten(s, backlog);

	sprintf(buf, "listen(SOCKET=%d, backlog=%d) - ret=%d\r\n", s, backlog, ret);
	Append(buf);
	
	return ret;
}


SOCKET WINAPI _accept(SOCKET s, struct sockaddr FAR *addr, int FAR *addrlen)
{
	char buf[1024];
	int ret= Oaccept(s, addr, addrlen);
	
	sprintf(buf, "accept(SOCKET=%d) - ret=(SOCKET)%d//New socket descriptor\r\n", s, ret);
	Append(buf);

	return ret;
}

int WINAPI _bind(SOCKET s, const struct sockaddr FAR *name, int namelen)
{
	char buf[1024];
	int ret = Obind(s, name, namelen);

	sprintf(buf, "bind(SOCKET=%d, sockaddr=%x) - ret=%d\r\n", s, (DWORD)name, ret);
	Append(buf);

	return ret;
}

int WINAPI _closesocket(SOCKET s)
{
	char buf[1024];
	int ret = Oclosesocket(s);
	
	sprintf(buf, "closesocket(SOCKET=%d) - ret=%d\r\n", s, ret);
	Append(buf);

	return ret;
}

int WINAPI _connect( SOCKET s, const struct sockaddr FAR *name, int namelen)
{
	char buf[1024];
	int ret = Oconnect(s, name, namelen);

	sprintf(buf, "connect(SOCKET=%d, sockaddr=%x) - ret=%d", s, (DWORD)name, ret);
	Append(buf);

	return ret;
}

SOCKET WINAPI _socket(int af, int type, int protocol)
{
	char buf[1024], buf2[1024];
	SOCKET ret=Osocket(af, type, protocol);

	sprintf(buf, "socket(af=");
	if(af==AF_INET)
		sprintf(buf, "%s%s, type=", buf, "AF_INET");
	else
		sprintf(buf, "%s%d, type=", buf, af);

	if(type==SOCK_STREAM)
		strcpy(buf2, "SOCK_STREAM");
	else if(type==SOCK_DGRAM)
		strcpy(buf2, "SOCK_DGRAM");
	else
		itoa(type, buf2, 10);
	
	sprintf(buf, "%s%s, protocol=%d) - ", buf, buf2, protocol);
	if(ret!=-1)
		sprintf(buf, "%sret=(SOCKET)%d //New socket descriptor\r\n", buf, ret);
	else
	{
		sprintf(buf, "%sret==SOCKET_ERROR(-1) -> WSAGetLastError()=", buf);
		if(OWSAGetLastError)
			sprintf(buf, "%s%d\r\n", OWSAGetLastError());
		else
			strcat(buf, "???\r\n");
	}

	Append(buf);
	
	return ret;
}




		
