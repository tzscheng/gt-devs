#!/bin/bash
# Manus glove -> runner teleoperation
cd "$(dirname "$0")" || exit 1

# The loader finds the SDK library next to the executable in lib/.
g++ -O2 -g -std=c++17 -W -Wall -o manus manus.cpp \
    -Iinclude \
    -Llib -lManusSDK_Integrated -Wl,-rpath,'$ORIGIN/lib' \
    -pthread

# Simulation build: no glove or SDK, synthetic open/close motion for runner-sim.
#g++ -O2 -std=c++17 -W -Wall -DMANUS_SIM -o manus-sim manus.cpp -pthread
