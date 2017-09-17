 Halt
⍝ Bring the robot to a controlled halt

 Steer 0 0 ⍝ Stop engines
 ⍝ Return IR sensor to "dead ahead" position
 BP.set_motor_position IR_MOTOR IR_OFFSET
