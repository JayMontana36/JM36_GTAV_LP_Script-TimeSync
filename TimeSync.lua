local PauseClock, GetLocalTime, AdvanceClockTimeTo
	= PauseClock, GetLocalTime, AdvanceClockTimeTo
local year, month, day, hour, minute, second
local TimeNextRun = 0
return {
	init	=	function()
					PauseClock(true)
				end,
	loop	=	function(Info)
					local Time = Info.Time
					if Time >= TimeNextRun then
						TimeNextRun = Time + 1000
						year, month, day, hour, minute, second = GetLocalTime(0,0,0,0,0,0)
						AdvanceClockTimeTo(hour, minute, second)
					end
				end,
	stop	=	function()
					PauseClock(false)
				end,
}