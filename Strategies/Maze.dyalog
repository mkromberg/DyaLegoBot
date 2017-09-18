﻿ action←Maze(angles distances);bow;closest;dir;dist;farthest;highI;lowI;max;mid;steer;time;turn;angle
 ⍝ Drive in a Maze; always head for biggest gap (favouring veering right)
 ⍝ angles    is a vector of angles at which distance was scanned
 ⍝ distances is a vector of scan distances corresponding to angles
 ⍝ return right power, left power, time to run.

 max←50                     ⍝ cap desired speed (0-100)
 mid←angles⍳⌊/|angles       ⍝ middle (=lowest angle)
 dist←10×⌊distances÷10      ⍝ reduce sensitivity
 closest←⌊/dist             ⍝ Lowest distance recorded
 farthest←⌈/dist
 lowI←dist⍳closest          ⍝ Where is nearest point
 highI←{⍵[⌈0.67×≢⍵]}⍸dist=farthest ⍝ veer right within farthest points

 :If closest<30 ⍝ edge away from a wall if very close
     turn←0⌈1-|angles[lowI]÷90  ⍝ How big a turn (AWAY from the obstacle)
     Log'Turning away from wall'
     turn←0.25 ⋄ time←0.5
     steer←(lowI<mid)⌽⌊0.5+max×1(-,+)turn×1⌊40÷1⌈closest

 :Else
     turn←0⌈|angles[highI]÷90 ⍝ How big a turn (TOWARDS the gap)
     time←0.5+0.5×closest>50  ⍝ whole second if we have more than 50cm to run
     steer←(highI>mid)⌽⌊0.5+max×1(-,+)turn×1⌊40÷1⌈closest
 :EndIf

 action←steer,time

 :If DEBUG
     dir←0<angle←angles[highI]
     bow←((1+dir)⊃'port' 'starboard'),' bow'
     Log'Clearest path is ',(⍕|angle),' degrees off the ',bow,'.'
     Log'Action: Apply',(,⍕(⍕¨steer),¨'%',¨'L +' 'R'),'power to wheels for ',(⍕time),'s.'
 :EndIf
⍝)(!Maze!mkrom!2017 9 18 3 11 17 0!0
