program main
	use mod_common
	use web3,only: serve_forever, route
	implicit none
	call serve_forever(c_str("8080"))
end program main
