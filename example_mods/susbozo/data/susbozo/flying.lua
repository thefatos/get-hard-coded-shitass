function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	if curStep >= 10 then
	  songPos = getSongPosition()
	  local currentBeat = (songPos/1000)*(bpm/300)
	  doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
end
