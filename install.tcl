package require tin 2.1
set dir [tin mkdir -force exprstar 1.0]
file copy README.md LICENSE pkgIndex.tcl exprstar.tcl $dir
