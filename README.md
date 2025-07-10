# expr\*
A modified form of the Tcl expr command that returns multiple arguments, delineated by commas.

Based on a discussion on the [Tcl wiki](https://wiki.tcl-lang.org/page/expr%2A).

## Installation
This package is a Tin package. Tin makes installing Tcl packages easy, and is available [here](https://github.com/ambaker1/Tin).

After installing Tin, simply run the following Tcl code to install the most recent version of "exprstar":

```tcl
package require tin 2.1
tin autoadd exprstar https://github.com/ambaker1/exprstar install.tcl
tin install exprstar
```

## Documentation
The package exprstar only adds one math function (vec) and one command (expr\*) to Tcl.

### \:\:tcl\:\:mathfunc\:\:vec
This command behaves the same as the Tcl list command, but because it is a "mathfunc", it can be used in a Tcl expression.
```
::tcl::mathfunc::vec arg ?arg ...?
```

### \:\:expr\*
This command behaves the same as the Tcl expr command, except that it returns a list, where elements are delineated by commas in the expression arguments. Internally, it uses the "\:\:tcl\:\:mathfunc\:\:vec" to process the comma-separated expressions.
```
::expr* arg ?arg ...?
```

## Example
Here is a simple example of how the "vec" math function and the "expr\*" command can be used to reduce the number of "expr" calls in your Tcl scripts.
```tcl
package require exprstar 1.0
set x 3.0
set y 4.0
set mylist [expr {vec(double(1),double(2))}]
lappend mylist {*}[expr* {$x, $y, hypot($x,$y)}]
puts $mylist; # 1.0 2.0 3.0 4.0 5.0
```

