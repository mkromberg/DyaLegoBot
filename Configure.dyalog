 Configure
⍝ Configure the ports used in our current DyaLegoBot
⍝ Store current position of IR sensor motor as "dead ahead"

 ANGLES←{(-⌽⍵),0,⍵}10×⍳10 ⍝ The angles we are going to scan
 IR_DELAY←0.03

⍝ Motor Ports
 IR_MOTOR←BP.PORT_A
 RIGHT_MOTOR←BP.PORT_B
 LEFT_MOTOR←BP.PORT_C

⍝ InfraRed Sensor
 IR_SENSOR←BP.PORT_1
 BP.set_sensor_type(IR_SENSOR BP.SENSOR_TYPE.EV3_INFRARED_PROXIMITY)
 IR_OFFSET←BP.get_motor_encoder IR_MOTOR

⍝ Color Sensor
 COLOR_SENSOR←BP.PORT_2
 BP.set_sensor_type(COLOR_SENSOR BP.SENSOR_TYPE.EV3_COLOR_COLOR_COMPONENTS)
