 RunScan single;STOP;d;m
⍝ Run scans in alternating directions
⍝ Global state:
⍝ distances: The recorded distances
⍝ angles:    The angles that are scanned (0=dead ahead, ¯90=left, 90=right)
⍝ indices:   Indices into distances and angles, REVERSED on each call

 Init 0 ⍝ Create/check instance of BrickPi3

 :If 0=⎕NC'indices'
     indices←⍳≢ANGLES
     DISTANCES←(≢ANGLES)⍴0
 :EndIf

 STOP←single

 :Repeat
     d←Scan IR_OFFSET+ANGLES[indices]
     DISTANCES[m/indices]←(m←d≠0)/d    ⍝ Update non-zero results
     indices←⌽indices
 :Until STOP
