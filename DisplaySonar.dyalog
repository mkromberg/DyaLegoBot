 r←DisplaySonar(angles distances)
⍝ Create "sonar" display from angles & distances

 r←¯10↓⍉⌽(((distances<100)\'*')@(↓10+⍉⌊0.5+1+(distances÷10)(×⍤1)1 2∘.○○angles÷200))(21 21⍴' ')
 r[11;11]←'⍋'
⍝)(!DisplaySonar!mkrom!2017 9 18 3 15 31 0!0
