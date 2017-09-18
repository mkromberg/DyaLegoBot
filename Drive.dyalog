 (strategy Drive endtest)data;delay;right;left
⍝ Drive the DyaLegoBot using specified strategy
⍝ <strategy> is a function working on <angles> <distance>
⍝ <endtest> is applied to <data> to decide when to end

 Init 0
 STOP←0 ⍝ Global PANIC switch
 STARTTIME←⎕AI[3]

 :Repeat
     RunScan 1          ⍝ Scan distances
     :If DEBUG ⋄ DisplaySonar ANGLES DISTANCES ⋄ :EndIf
     (left right delay)←strategy ANGLES DISTANCES
     Steer left right ⋄ ⎕DL delay ⋄ Steer 0 0
 :Until STOP∨endtest data

 Halt
⍝)(!Drive!mkrom!2017 9 18 3 15 35 0!0
