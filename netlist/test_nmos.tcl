loading history file ... 48 events added
Use openwrapper to create a new GUI-based layout window
Use closewrapper to remove a new GUI-based layout window

Magic 8.3 revision 681 - Compiled on Sat Aug 15 03:10:02 PM IST 2026.
Starting magic under Tcl interpreter
Using Tk console window
Using TrueColor, VisualID 0x21 depth 24
Input style sky130(): scaleFactor=2, multiplier=2
The following types are not handled by extraction and will be treated as non-electrical types:
    ubm 
Processing system .magicrc file
Switching to WIRING tool.
Switching to NETLIST tool.
Switching to PICK tool.
Switching to BOX tool.
Loading sky130A Device Generator Menu ...
New windows will not have a title caption.
New windows will not have scroll bars.
New windows will not have a border.
Repainting console in magic layout window colors
Using technology "sky130A", version 1.0.493-0-g0fe599b
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   0.010 x 0.010   ( 0.000,  0.000), ( 0.010,  0.010)  0.000     
lambda:        1 x 1       (     0,  0    ), (     1,  1    )  1         
Main console display active (Tcl8.6.14 / Tk8.6.14)
% box 0 150 1000 350
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:  10.000 x 2.000   ( 0.000,  1.500), ( 10.000,  3.500)  20.000    
lambda:     1000 x 200     (     0,  150  ), (  1000,  350  )  200000    
% paint ndiffusion
Loading DRC CIF style.
Created database crash recovery file /tmp/MAG4307.6coBvz
% box 450 0 550 500
Root cell box:
           width x height  (   llx,  lly  ), (   urx,  ury  )  area (units^2)

microns:   1.000 x 5.000   ( 4.500,  0.000), ( 5.500,  5.000)  5.000     
lambda:      100 x 500     (   450,  0    ), (   550,  500  )  50000     
% paint polysilicon
% drc check

% drc why

% save test_nmos

Unknown command: 'crash' 'save' at (1003, 658)
% quit
0
Unknown command: 'crash' 'save' at (1003, 658)
Unknown command: 'crash' 'save' at (1003, 658)
Unknown command: 'crash' 'save' at (1003, 658)
% 