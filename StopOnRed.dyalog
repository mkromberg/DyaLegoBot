 stop←StopOnRed dummy;b;g;level;r
⍝ Stop if it looks as if we are over something Red

 (r g b level)←BP.get_sensor COLOR_SENSOR

 :If r>20
 :AndIf r∧.>1.5×g b
     stop←1
     Log'Stopping on red floor: ',⍕r g b
 :Else
     stop←0
 :EndIf
⍝)(!StopOnRed!pi!2017 9 17 16 19 46 0!0
