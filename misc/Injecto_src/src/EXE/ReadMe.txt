i = 0x00401005
ii = 0x0066fd90

	mov eax, 00401005h //i // i==  Pointer to function (DWORD)
	mov ebx, 0066fd90h //ii// ii== Argument (DWORD)
	push ebx //Push Argument
	call eax //Call function
	pop ebx
	int 3h //Breakpoint


B8 05 10 40 00       mov         eax, 00401005h // Pointer to function (DWORD)
BB 90 FD 66 00       mov         ebx, 0066FD90h // Argument to pass (DWORD)
53                   push        ebx
FF D0                call        eax
5B                   pop         ebx
CC                   int         3
<bytes...>
