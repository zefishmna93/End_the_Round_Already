# End the Round Already!

Automatically triggers randomats that will help players locate each other to end the round faster. These randomats trigger once there are as many or fewer players left in the round than the configurable minimum. This minimum does not include jester team roles in its count. The first randomat will trigger after a configurable number of seconds and the second will trigger a configurable number of seconds after the first.
<br>
<br>

**Randomats:**
* Radars for Everyone!
* No one can hide from my sight
<br>
<br>

**Acknowledgements:**<br>
Special thanks to ["Corvatile"](https://steamcommunity.com/id/Corvatile) and ["Malivil"](https://steamcommunity.com/id/malivil) for creating these randomats!
<br>
<br>
<br>

**Server cvars:**
```c++
ttt_end_the_round_radar_delay 60 // The time in seconds to delay after the min number of players are left to trigger the radar randomat

ttt_end_the_round_wall_hack_delay 120 // The time in seconds to delay after the radar randomat triggers to trigger the wall hack randomat

ttt_end_the_round_min_players 2 // The minimum number of players needed to be left alive before the randomats trigger (this does not include jester team roles in its count)
```
