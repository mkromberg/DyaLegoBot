 r←Scan angles;i;n;z
 ⍝ Called by RunScan to perform a scan on a set of angles

 r←(n←≢ANGLES)⍴0

 :For i :In ⍳n
     :Hold 'PYNAPL' ⍝ intergave not thread safe
         z←BP.set_motor_position IR_MOTOR,i⊃angles
         ⎕DL IR_DELAY
         r[i]←BP.get_sensor IR_SENSOR
     :EndHold
 :EndFor
