# Shared.tcl: Common Tcl script to compile whole design
# Copyright (C) 2013 CESNET
# Author: Viktor Puš <pus@cesnet.cz>
#         Jiri Matousek <xmatou06@stud.fit.vutbr.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

source $OFM_PATH/build/misc/getopt.tcl

set NB_COMP_BASE $FIRMWARE_BASE/comp
set NB_FLAGS(VERBOSITY) 1

proc nb_batch_init {} {
    global NB_BATCH_CMD NB_BATCH_FILES
    set NB_BATCH_CMD ""
    set NB_BATCH_FILES [list]
}

proc nb_batch_add {cmd fname} {
    global NB_BATCH_CMD NB_BATCH_FILES
    if {$NB_BATCH_CMD == $cmd} {
        lappend NB_BATCH_FILES $fname
    } else {
        eval {*}$NB_BATCH_CMD $NB_BATCH_FILES
        set NB_BATCH_CMD $cmd
        set NB_BATCH_FILES [list $fname]
    }
}

proc nb_batch_finish {} {
    global NB_BATCH_CMD NB_BATCH_FILES
    if {$NB_BATCH_CMD != ""} {
        eval {*}$NB_BATCH_CMD $NB_BATCH_FILES
        set NB_BATCH_CMD ""
        set NB_BATCH_FILES [list ]
    }
}

# ---------------------- Common procedures ----------------------------
# String Generation
proc GenStr {NUM CH} {
    set str $CH
    for {set i 0} {$i<$NUM} {incr i} {
        set str [format "%s%s" $str $CH]
    }
    return $str
}

# Print Label
proc PrintLabel {LABEL} {
    global NB_FLAGS
    if {$NB_FLAGS(VERBOSITY) == 0} {
        return
    }
    set lines [GenStr 70 "-"]
    set space [GenStr [expr [expr 65 - [string length $LABEL]] / 2] " "]
    puts "$lines\n$space $LABEL\n$lines"
}

# Filter duplicate entries in list and preserve the order
proc uniqueList {LIST} {
    set new {}
    foreach item $LIST {
        if {$item ni $new} {
            lappend new $item
        }
    }
    return $new
}

# Make PATH as simple as possible by iterative substitutions of
# /dir_name/../ by /
proc SimplPath {PATH {ABS true}} {
    set original $PATH

    set FIRST_CHAR [ string index $PATH 0 ]
    if { $FIRST_CHAR == "/" || !$ABS} {
        set FULLPATH "$PATH"
    } else {
        set FULLPATH [join [list [ pwd ] "$PATH"] "/" ]
    }

    # Subsitute /./ or // by /
    set RE "/\\./|//"
    while {[regexp $RE $FULLPATH]} {
        regsub $RE $FULLPATH "/" FULLPATH
    }

    # Regular expression:
    # / followed by
    # one or more repetitions of
    #   zero or one non-slash character followed by
    #   one non-slash non-dot character
    # followed by / followed by .. followed by /
    set RE "/(\[^/\]?\[^/.\])+/\\.\\./"

    while {[regexp $RE $FULLPATH]} {
        regsub $RE $FULLPATH "/" FULLPATH
    }


    return $FULLPATH
}

# Process all macros in the file and write result to another file.
# Currently supported macros:
# -- MACRO INSERT MyFunc
# inserts contents of appropriate file (matched in the SUBSTS list) from tag
# -- MACRO START
# to the end
proc ProcessMacros {SRC DST SUBSTS} {
    upvar 1 $SUBSTS SUBSTS_VAR

    set srch [open $SRC]
    set dsth [open $DST w]

    puts $dsth "-- This file was generated by translation system."
    puts $dsth "-- Do not commit it into source code archive.\n"

    while {[gets $srch line] >= 0} {
        # For each line in the source file

        set RE "-- MACRO INSERT *"
        if {[regexp -- $RE $line]} {
            # If there is any macro on this line
            set found 0
            foreach i $SUBSTS {
                # For each item in the list of substitutions
                set fname [lindex $i 0]
                set RE "-- MACRO INSERT $fname*"

                if {[regexp -- $RE $line]} {
                    # If we found correct substitution
                    set found 1
                    set start 0
                    set fname [lindex $i 1]
                    set funh [open $fname]
                    while {[gets $funh substline] >= 0} {
                        if {$start == 1} {
                            puts $dsth $substline
                        }

                        set RE "-- MACRO START*"
                        if {[regexp -- $RE $substline]} {
                            set start 1
                        }
                    }
                    if {$start == 0} {
                        puts "Warning: This macro has not been expanded:"
                        puts $line
                        puts $dsth $line
                        puts $dsth "-- $fname does not contain MACRO START macro!"
                    }
                    close $funh
                }
            }
            if {$found == 0} {
                puts "Warning: This macro has not been expanded:"
                puts $line
                puts $dsth $line
                puts $dsth "-- Cannot find this macro in the list of substitutions!"
            }
        } else {
            # If there is no macro
            puts $dsth $line
        }
    }

    close $srch
    close $dsth
}


# Transforms given boolean values "true" and "false" into verilog-like
# representation 1'b1 and 1'b0, respectively.
proc BoolVerilog {BOOL} {
    if {$BOOL == "true" || $BOOL == 1} {
        return "1'b1"
    } else {
        return "1'b0"
    }
}

# convert hexadecimal to binary form
proc hex2bin {hex} {
    set t {
        0 0 1 1 2 10 3 11 4 100 5 101 6 110 7 111
        8 1000 9 1001 a 1010 b 1011 c 1100 d 1101 e 1110 f 1111
    }
    regsub {^0[xX]} $hex {} hex
    return [string map -nocase $t $hex]
}

# convert decimal to binary form
proc dec2bin {dec} {
    set res {}
    while {$dec>0} {
        set res [expr {$dec%2}]$res
        set dec [expr {$dec/2}]
    }
    if {$res == {}} {set res 0}
    return $res
}

# Transfrom given verilog-like value into VHDL compatible vector form
proc VectorVerilog {VALUE} {
    set width [string range $VALUE 0 [expr {[string first "'" $VALUE]} - 1]]
    set type [string range $VALUE [expr {[string first "'" $VALUE] + 1}] \
        [expr {[string first "'" $VALUE] + 1}]]
    set output [string range $VALUE [expr {[string first "'" $VALUE] + 2}] end]

    if {$type == "b"} {
        return "\"$output\""
    } else {
        if {[expr $width % 8] == 0 && $type == "h"} {
            return "X\"$output\""
        } else {
            if {$type == "h"} {
                set ret [hex2bin $output]
            } elseif {$type == "d"} {
                set ret [dec2bin $output]
            }
            for {set i [string length $ret]} {$i < $width} {incr i} {
                append ret "0"
            }
            return $ret
        }
    }
    error "Function VectorVerilog couldn't transform value"
}

proc ofm_replace_comp_path {fname} {
    if ![file exists $fname] {
        regsub "comp" $fname "ofm/comp" ofm_fname
        if [file exists $ofm_fname] {
            upvar 2 ENTITY_MODFILE PEM
            set P [expr [info exists PEM] ? {" requested in '$PEM'"} : {""}]
            puts "WARNING: Substituting source path$P to OFM: $fname => $ofm_fname"
            return $ofm_fname
        }
    }
    return $fname
}

proc ofm_replace_modules_path {ENTITY_BASE} {
    if ![file exists $ENTITY_BASE/Modules.tcl] {
        regsub "comp" $ENTITY_BASE "ofm/comp" OFM_ENTITY_BASE
        regsub "comp/mi32_tools" $OFM_ENTITY_BASE "comp/mi_tools" OFM_ENTITY_BASE

        if [file exists $OFM_ENTITY_BASE/Modules.tcl] {
            upvar 3 ENTITY PE ENTITY_MODFILE PEM
            set P [expr [info exists PEM] ? {" requested in '$PEM'"} : {""}]
            puts "WARNING: Substituting module path$P to OFM: $ENTITY_BASE => $OFM_ENTITY_BASE"
            return $OFM_ENTITY_BASE
        }
    }
    return $ENTITY_BASE
}

# ------------------------ ApplyToComponent -----------------------------

proc DeduceType {FNAME {TYPE ""}} {
    # Backward compatibility
    set type $TYPE
    if {[file tail $FNAME] == "DevTree.tcl" && $TYPE == ""} {
        set type "DEVTREE"
    } elseif {[regexp ".xci$" $FNAME] && $TYPE == ""} {
        set type "VIVADO_IP_XACT"
    } elseif {[regexp ".ip$" $FNAME] && $TYPE == ""} {
        set type "QUARTUS_IP"
    } elseif {[regexp ".bd$" $FNAME] && $TYPE == ""} {
        set type "VIVADO_BD"
    }
    return $type
}

# Apply Command To Module List
proc ApplyToMods {MODULE COMMAND FILES {TYPE ""}} {
    upvar 1 $FILES FILES_VAR

    foreach i $MODULE {
        if {[llength $i] == 2} {
            # 2-item list is special case: first item is library name, second if filename.
            # Reorganize this module description for unified access
            set i [list [lindex $i 1] "LIBRARY" [lindex $i 0]]
        }

        # First item is filename and rest (if any) are pairs of (param_name, param_value).
        set params [lassign $i fname]
        set fname [ofm_replace_comp_path [SimplPath $fname false]]
        set fname [SimplPath $fname]

        # Override type
        set local_type $TYPE
        foreach {param_name param_value} $params {
            if {$param_name == "TYPE"} {
                set local_type $param_value
            }
        }

        # Backward compatibility
        set type [DeduceType $fname $local_type]
        lappend params "TYPE" $type

        set f [concat $fname $params]
        if {$f ni $FILES_VAR} {
            foreach cmd $COMMAND {
                {*}$cmd $fname $params
            }
            set FILES_VAR [linsert $FILES_VAR 0 $f]
        }
    }
}

# Apply Command To Component List
proc ApplyToComponents {COMPONENTS COMMAND FILES SV_LIBS {LEVEL "1"} {EVAL_COMP ""}} {
    upvar 1 $FILES FILES_VAR
    upvar 1 $SV_LIBS SV_LIBS_VAR
    foreach i $COMPONENTS {
        ApplyToComponent $i $COMMAND FILES_VAR SV_LIBS_VAR $LEVEL $EVAL_COMP
    }
}

# Apply Commnad To Single Component
proc ApplyToComponent {COMPONENT COMMAND FILES SV_LIBS LEVEL EVAL_COMP} {
    upvar 1 $FILES FILES_VAR
    upvar 1 $SV_LIBS SV_LIBS_VAR

    # Skip applying if the same component already passed (same path & ARCHGRP)
    set CMP [list [SimplPath [lindex $COMPONENT 1]] "TYPE" "COMPONENT" "NAME" [lindex $COMPONENT 0] "ARCHGRP" [lindex $COMPONENT 2]]
    if {$CMP ni $FILES_VAR} {
        lappend FILES_VAR $CMP
    } else {
        return
    }

    # variable setting -----------------------------
    lassign $COMPONENT ENTITY ENTITY_BASE ARCHGRP
    set ENTITY_BASE     [SimplPath $ENTITY_BASE false]
    set ENTITY_BASE     [ofm_replace_modules_path $ENTITY_BASE]
    set ENTITY_MODFILE   "$ENTITY_BASE/Modules.tcl"

    # label printing ------------------------------
    if { $LEVEL == 1 } {
        PrintLabel $ENTITY
    }

    # script execution ----------------------------
    global NB_COMP_BASE
    global NB_PLATFORM_TAGS
    global OFM_PATH
    global FIRMWARE_BASE

    set PLATFORM_TAGS $NB_PLATFORM_TAGS
    set COMP_BASE $NB_COMP_BASE
    set MOD ""
    set SV_LIB ""
    set COMPONENTS ""
    set PACKAGES ""
    array set SRCS {}

    # Get hierarchy info
    if ![file exists $ENTITY_MODFILE] {
        # Check for parent entity modfile
        upvar 2 ENTITY PE ENTITY_MODFILE PEM
        set P [expr [info exists PEM] ? {" requested in '$PEM' as $PE"} : {""}]
        puts "ERROR: Modfile '$ENTITY_MODFILE'$P doesn't exists!"
        exit 1
    } else {
        source $ENTITY_MODFILE
    }

    # collect values of SV_LIB
    foreach i $SV_LIB {
        set SV_LIBS_VAR [linsert $SV_LIBS_VAR 0 $i]
    }

    # apply command to local packages -------------
    ApplyToMods $PACKAGES $COMMAND FILES_VAR

    # apply command to subcomponents --------------
    ApplyToComponents $COMPONENTS $COMMAND FILES_VAR SV_LIBS_VAR [expr $LEVEL + 1] $EVAL_COMP

    # apply command to local modules --------------
    ApplyToMods $MOD $COMMAND FILES_VAR ""

    # Apply to all items in array SRCS
    foreach SRC_TYPE [array names SRCS] {
        ApplyToMods $SRCS($SRC_TYPE) $COMMAND FILES_VAR $SRC_TYPE
    }

    # Call synthetizer-specific code (if defined)
    foreach eval_comp $EVAL_COMP {
        {*}$eval_comp $ENTITY $ENTITY_BASE $ARCHGRP
    }
}

# ------------------------ ApplyToInstances ----------------------------

# Apply Command To Instances within Component List
proc ApplyToInstances {COMPONENTS COMMAND PARAMS {PATH ""} {LEVEL "1"} } {
    upvar 1 $PARAMS param_array
    foreach i $COMPONENTS {
        ApplyToInstance $i $COMMAND param_array $PATH $LEVEL
    }
}

# Apply Commnad To Instances within Single Component
proc ApplyToInstance {COMPONENT COMMAND PARAMS PATH LEVEL} {
    upvar 1 $PARAMS param_array
    # variable setting -----------------------------
    set ENTITY         [lindex $COMPONENT 0]
    set ENTITY_BASE    [lindex $COMPONENT 1]
    set ARCHGRP        [lindex $COMPONENT 2]
    set ENTITY_MODFILE "$ENTITY_BASE/Modules.tcl"
    if { [llength $COMPONENT] == 4 } {
        set inst_list [lindex $COMPONENT 3]
    } else {
        set inst_list ""
    }

    # label printing ------------------------------
    if { $LEVEL == 1 } {
        PrintLabel $ENTITY
    }

    # script execution ----------------------------
    set MOD ""
    set SV_LIB ""
    set COMPONENTS ""
    set PACKAGES ""

    source $ENTITY_BASE/Modules.tcl

    # get list of instances  ----------------------
    if { $inst_list != "" } {
        foreach i $inst_list {
            # set instance path and architecture
            if { $LEVEL == 1 } {
                set inst_path [lindex $i 0]
            } else {
                set inst_path [format "%s.%s" $PATH [lindex $i 0]]
            }
            set inst_arch [lindex $i 1]

            # apply procedure to current instance
            set eval_cmd "$COMMAND $ENTITY_BASE $ENTITY $inst_arch $inst_path param_array"
            eval $eval_cmd

            # apply command to instances in subcomponents
            if { $COMPONENTS != "" } {
                ApplyToInstances $COMPONENTS $COMMAND param_array $inst_path [expr $LEVEL + 1]
            }
        }
    }
}

# ---------------------- Variable removing ------------------------------
# Remove used variables
proc RemoveVars {VARS} {
    foreach i $VARS {
        if { [info exist $i] } {
            unset $i
        }
    }
}

# -----------------------------------------------------------------------------
# Procedure nb_file_update
# Write the content to a file only when it is necessary.
# This can be useful for Make prerequisites.
#
proc nb_file_update {filename content} {
    file mkdir [file dirname $filename]
    if {[file exists $filename]} {
        set f [open $filename]
        set content_original [read $f]
        close $f
    } else {
        set content_original "$content DEADBEEF"
    }
    if {$content_original != $content} {
        set f [open $filename "w"]
        puts -nonewline $f $content
        close $f
        return true
    }
    return false
}

proc source_with_args {file args} {
  set argv $::argv
  set argc $::argc
  set ::argv $args
  set ::argc [llength $args]
  set code [catch {uplevel [list source $file]} return]
  set ::argv $argv
  set ::argc $argc
  return -code $code $return
}

proc source_with_vars {file vars} {
    foreach {name value} $vars {
        set $name $value
    }
    source $file
}
