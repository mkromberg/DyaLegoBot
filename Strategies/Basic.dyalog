 action←Basic(angles distances);bow;closest;dir;lowI;max;mid;steer;time;turn
 ⍝ Basic, Conservative Driving
 ⍝ angles    is a vector of angles at which distance was scanned
 ⍝ distances is a vector of scan distances corresponding to angles
 ⍝ return right power, left power, time to run

 max←50                     ⍝ cap desired speed (0-100)
 mid←angles⍳⌊/|angles       ⍝ middle (=lowest angle)
 closest←⌊/distances        ⍝ Lowest distance recorded
 lowI←distances⍳closest     ⍝ Where is nearest point

 :If DEBUG
     ⎕←1 0⍕9⌊⌊DISTANCES÷10  ⍝ leading digit of all distances
 :EndIf

 :If (closest>35)∧(distances[⍸20≥|angles])∧.≥60 ⍝ all clear within +/- 20 degrees?
     action←max max 3       ⍝ full speed ahead for a whole second
     Log'All clear; full speed ahead!'
 :Else
     turn←0⌈1-|angles[lowI]÷90  ⍝ How big a turn (90=1)?
     :If (turn=0)∧0.1×closest<25 ⍝ edge away from wall
         Log'Turning away from wall'
         turn←0.2
     :EndIf
     time←0.5+0.5×closest>50 ⍝ whole second if we have more than 30cm
     steer←(lowI<mid)⌽⌊0.5+max×1(-,+)turn×1⌊40÷closest
     ⍝ full turn (stop 1 wheel) if 90∘ turn required and <40cm to go
     action←steer,time
     :If DEBUG
         dir←0<angle←angles[lowI]
         bow←((1+dir)⊃'port' 'starboard'),' bow'
         Log'Obstacle ',(⍕closest),'cm away, ',(⍕|angle),' degrees off the ',bow,'.'
         Log'Action: Apply',(,⍕(⍕¨steer),¨'%',¨'L +' 'R'),'power to wheels for ',(⍕time),'s.'
     :EndIf
 :EndIf
