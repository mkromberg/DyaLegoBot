 Init force;z
⍝ Ensure that:
⍝    - The Python Bridge is loaded as "Python"
⍝    - An instance iof BrickPi3 is in "BP"
 DEBUG←1

 :If force∨9≠⎕NC'BP'
            ⍝ This directory should be changed to the directory
            ⍝ where you have pynapl saved
     ⎕SE.SALT.Load'/home/pi/pynapl/pynapl/Py -target=#'
     Python←⎕NEW #.Py.Py('Version' 3)
     Python.Exec'import brickpi3'
     BP←Python.Eval'brickpi3.BrickPi3()'
 :EndIf

 Configure  ⍝ Set / Record BrickPi3 port configuration
⍝)(!Init!pi!2017 9 17 16 21 51 0!0
