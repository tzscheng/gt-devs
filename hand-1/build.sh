#!/bin/bash
# hand runner (UDP <-> CAN), see runner.c header for usage
cd "$(dirname "$0")"

gcc -W -Wall -O2 -o runner runner.c -lm

# simulation build: no CAN bus, software motor model (for console / protocol checks)
#gcc -W -Wall -O2 -DRUNNER_SIM -o runner-sim runner.c -lm

# motor/encoder check tool with a curses screen (talks to the hand over CAN directly)
gcc -W -Wall -O2 -o monitor monitor.c -lncurses -lm

# simulation build: no CAN bus, for trying the screen
#gcc -W -Wall -O2 -DMONITOR_SIM -o monitor-sim monitor.c -lncurses -lm
