if {![package vsatisfies [package provide Tcl] 8.6-]} {return}
package ifneeded exprstar 1.0 [list source [file join $dir exprstar.tcl]]