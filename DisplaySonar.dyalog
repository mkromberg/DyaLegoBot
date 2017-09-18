 r←DisplaySonar(angles distances)
⍝ Create "sonar" display from angles & distances

 r←¯8↓⍉⌽(((distances<100)\'*')@(↓10+⍉⌊0.5+1+(distances÷10)(×⍤1)1 2∘.○○angles÷200))(21 21⍴' ')
 r[12;11]←'⍋'
⍝)(!DisplaySonar!pi!2017 9 17 20 6 1 0!0
