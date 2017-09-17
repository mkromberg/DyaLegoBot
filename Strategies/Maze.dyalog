 action←Maze(angles distances);bow;closest;dir;dist;farthest;highI;lowI;max;mid;steer;time;turn
 ⍝ Drive in a Maze; always head for highest rightmost
 ⍝ angles    is a vector of angles at which distance was scanned
 ⍝ distances is a vector of scan distances corresponding to angles
 ⍝ return right power, left power, time to run

 max←50                     ⍝ cap desired speed (0-100)
 mid←angles⍳⌊/|angles       ⍝ middle (=lowest angle)
 dist←⌊distances÷10         ⍝ reduce sensitivity
 closest←⌊/dist             ⍝ Lowest distance recorded
 farthest←⌈/dist
 lowI←distances⍳closest     ⍝ Where is nearest point
 highI←dist⍳farthest

 :If DEBUG
     ⎕←1 0⍕9⌊dist  ⍝ leading digit of all distances
 :EndIf

 turn←0⌈1-|angles[highI]÷90 ⍝ How big a turn (90=1)?
 time←0.5+0.5×closest>50 ⍝ whole second if we have more than 30cm
 steer←(lowI<mid)⌽⌊0.5+max×1(-,+)turn×1⌊40÷closest
 ⍝ full turn (stop 1 wheel) if 90∘ turn required and <40cm to go
 action←steer,time
 :If DEBUG
     dir←0<angle←angles[highI]
     bow←((1+dir)⊃'port' 'starboard'),' bow'
     Log'Clearest path is ',(⍕|angle),' degrees off the ',bow,'.'
     Log'Action: Apply',(,⍕(⍕¨steer),¨'%',¨'L +' 'R'),'power to wheels for ',(⍕time),'s.'
 :EndIf
⍝)(!Maze!pi!2017 9 17 13 57 48 0!0
