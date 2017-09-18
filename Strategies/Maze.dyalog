 action←Maze(angles distances);bow;closest;dir;dist;farthest;highI;lowI;max;mid;steer;time;turn;angle
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
     time←0.25
     steer←max×(lowI<mid)⌽¯1 1

 :Else
     turn←0⌈|angles[highI]÷90  ⍝ How big a turn (TOWARDS the gap)
     turn←(0.3×closest>30)⌊turn ⍝ Don't be too aggressive following the gap
     time←0.5+0.5×closest>50   ⍝ whole second if we have more than 50cm to run
     steer←(highI>mid)⌽⌊0.5+max×1(-,+)turn
 :EndIf

 action←steer,time

 :If DEBUG
     dir←0<angle←angles[highI]
     bow←((1+dir)⊃'port' 'starboard'),' bow'
     Log'Clearest path is ',(⍕|angle),' degrees off the ',bow,'.'
     Log'Closest obstacle is ',(⍕closest),'cm away at a heading of ',⍕angles[lowI]
     Log'Action: Apply',(,⍕(⍕¨steer),¨'%',¨'L +' 'R'),'power to wheels for ',(⍕time),'s.'
 :EndIf
⍝)(!Maze!pi!2017 9 17 20 20 31 0!0
