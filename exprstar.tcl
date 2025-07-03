# exprstar.tcl
# Adds the mathfunc "list" and the command "expr*"
# Based on discussions on Tcl wiki: https://wiki.tcl-lang.org/page/expr%2A
# Written by Alex Baker (ambaker1@mtu.edu).
# See LICENSE.

proc ::tcl::mathfunc::list {args} {return $args}
proc ::expr* {args} {uplevel 1 "::expr {list([join $args])}"}
package provide expr* 1.0

# Example:
if {1} {
    set x 3.0
    set y 4.0
    set mylist [expr {list(double(1),double(2))}]
    lappend mylist {*}[expr* {$x, $y, hypot($x,$y)}]
    puts $mylist; # 1.0 2.0 3.0 4.0 5.0
}
