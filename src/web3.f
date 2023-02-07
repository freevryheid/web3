module web3
	use, intrinsic::iso_c_binding
	use mod_common
	implicit none
	private
	public::serve_forever,route
	character(len=8),parameter::RESPONSE_PROTOCOL="HTTP/1.1"
	character(len=17),parameter::HTTP_200=RESPONSE_PROTOCOL//" 200 OK"//new_line('a')//new_line('a')
	character(len=22),parameter::HTTP_201=RESPONSE_PROTOCOL//" 201 Created"//new_line('a')//new_line('a')
	character(len=24),parameter::HTTP_404=RESPONSE_PROTOCOL//" 404 Not found"//new_line('a')//new_line('a')
	character(len=36),parameter::HTTP_500=RESPONSE_PROTOCOL//" 500 Internal Server Error"//new_line('a')//new_line('a')
	type(c_ptr),bind(c,name="method")::pmethod
	type(c_ptr),bind(c,name="uri")::puri
	character(len=:),allocatable::fmethod,furi
	interface
		subroutine serve_forever(port)bind(c,name="serve_forever")
			import c_char
			character(kind=c_char)::port
		endsubroutine serve_forever
	endinterface
	contains
		subroutine route()bind(c,name="route")
			call c_f_str_ptr(pmethod,fmethod)
			call c_f_str_ptr(puri,furi)
			if(furi.eq."/".and.fmethod.eq."GET")then
				write(*,*)HTTP_200
			else
				write(*,*)HTTP_500
			endif
		endsubroutine route
endmodule web3
