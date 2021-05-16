local timeStart, timeStop
local startTime, endTime, elapsedTime

function benchmark(bool)

	if bool then
		timeStart = os.clock(), collectgarbage("collect")
		startTime = os.time()
	else
		timeStop = os.clock()
		endTime = os.time()
		elapsedTime = os.difftime(endTime, startTime)
	end

	if timeStart ~= nil and timeStop ~= nil then
		print(string.format('Start Time : %.3fs', startTime))
		print(string.format('Elapsed Time (ms) : %gs', timeStart - timeStop))
		print(string.format('Memory used : %g', collectgarbage("count")))
		print(string.format('End Time : %.3fs', endTime))
		print(string.format('Elapsed Time (ms) : %gs', elapsedTime))
		collectgarbage("stop")
	end
end

function test()
	benchmark(true)
	-- code
	benchmark(false)
end
