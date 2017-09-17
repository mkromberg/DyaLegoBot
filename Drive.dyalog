 (strategy Drive endtest)data;delay;right;left
⍝ Drive the DyaLegoBot using specified strategy
⍝ <strategy> is a function working on <angles> <distance>
⍝ <endtest> is applied to <data> to decide when to end

 Init 0
 STOP←0 ⍝ Global PANIC switch
 STARTTIME←⎕AI[3]

 :Repeat
     RunScan 1          ⍝ Scan distances
     :If DEBUG
         ⎕←¯10↓⍉⌽('*'@(↓10+⍉⌊0.5+1+(DISTANCES÷10)(×⍤1)1 2∘.○○ANGLES÷200))(21 21⍴' ')
     :EndIf
     (left right delay)←strategy ANGLES DISTANCES
     Steer left right ⋄ ⎕DL delay ⋄ Steer 0 0
 :Until STOP∨endtest data

 Halt
⍝)(!Drive!pi!2017 9 17 13 55 2 0!0
