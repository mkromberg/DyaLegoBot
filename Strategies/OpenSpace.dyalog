 action←OpenSpace(angles distances);bow;closest;d;dir;lowI;max;mid;steer;time;turn;rate
 ⍝ Avoid the walls
 ⍝ angles    is a vector of angles at which distance was scanned
 ⍝ distances is a vector of scan distances corresponding to angles
 ⍝ return right power, left power, time to run.

 max←75                     ⍝ cap desired speed (0-100)
 mid←angles⍳⌊/|angles       ⍝ middle (=lowest angle)
 closest←⌊/distances        ⍝ Lowest distance recorded
 lowI←distances⍳closest     ⍝ Where is nearest point
 turn←0⌈1-|angles[lowI]÷90  ⍝ How big a turn (90=1)?

 :If (closest>35)∧(d←distances[⍸20≥|angles])∧.≥60 ⍝ all clear within +/- 20 degrees?
     action←max max 2       ⍝ full speed ahead for 2 seconds
     Log'All clear; full speed ahead!'

 :ElseIf d∧.≤30             ⍝ everything ahead (+/- 20 degrees) is closer than 30cm
     action←50 ¯50 2        ⍝ do a 180
     Log'Panic! Turn around...'

 :ElseIf (turn=0)∧closest<25    ⍝ No turn required, but there is close obstacle
     action←(lowI<mid)⌽¯30 30 0.5
     Log'Turning away from wall'

 :Else ⍝ Normal turn
     time←0.5+0.5×closest>50 ⍝ whole second if we have more than 30cm
     rate←turn×1⌊40÷closest  ⍝ exaggerate turn proportional to closeness of obstacle (<40cm)
     steer←100⌊(lowI<mid)⌽⌊0.5+max×1(-,+)rate ⍝ swap if obstacle is on left
     action←steer,time

     :If DEBUG
         dir←0<angle←angles[lowI]
         bow←((1+dir)⊃'port' 'starboard'),' bow'
         Log'Obstacle ',(⍕closest),'cm away, ',(⍕|angle),' degrees off the ',bow,'.'
         Log'Action: Apply',(,⍕(⍕¨steer),¨'%',¨'L +' 'R'),'power to wheels for ',(⍕time),'s.'
     :EndIf
 :EndIf
⍝)(!OpenSpace!pi!2017 9 17 20 47 58 0!0
