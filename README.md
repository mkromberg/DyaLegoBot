# DyaLegoBot
Mortens Experiments with a BrickPi3 / Lego based robot

To get startedm copy the files to your bit and try this:

    ]load /home/pi/DyaLegoBot/*

Loads the core of the bot code.

    ]load /home/pi/DyaLegoBot/Strategies/*

Loads the various "strategy" implementation functions. Pass one of these as the left operand to the Drive operator. The right argument is a stop function which will take the right operator as an argument; to run for ever you can use ~ 1:

    Basic Drive ~ 1
