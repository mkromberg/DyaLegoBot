 Steer(left right)
⍝ Apply power to motors

 :Hold 'PYNAPL' ⍝ Python I/F not thread safe
     BP.set_motor_power¨(LEFT_MOTOR left)(RIGHT_MOTOR right)
 :EndHold
