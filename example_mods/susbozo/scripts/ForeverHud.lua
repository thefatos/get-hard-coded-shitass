-- before you commenting why the the difficulty is easy but i play on hard
-- its based on the number difficulty in the song have
-- like only 1 diff no matter what the diff named it will be writen easy
-- bwy mwe laztrix uwu pwease cwedit mwe <3
-- sorry if it bad i tried my best to replicate it after all <3
-- pm me if i miss something

--[[ [ Changelog ]

   --change the camera speed value to 1.6
   --add unnecessary text up there

]]

--[[ list that ill add later

    Forever note splash
    Forever ratings

   ]]

  
local usehud = false   -- set to true if wanna use this
function onCreate()
  if usehud then
        makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
				setTextSize('newScoreAcc',16);
				addLuaText('newScoreAcc');
				setTextBorder("newScoreAcc", 1, '000001')
        if not downscroll then
					makeLuaText('sogn', '', 0, 4, 695);
					makeLuaText('daVer', 'Psych Engine v'..version,0, 1070, 695);
				  elseif  downscroll then
					makeLuaText('sogn', '', 0, 4, 5);
					makeLuaText('daVer', 'Psych Engine v'..version,0, 1070, 5);
				end
					setTextAlignment('sogn', 'left');
					setTextAlignment('daVer', 'right');
					setTextBorder("sogn", 1, '000001')
					setTextBorder("daVer", 1, '000001')
					setTextSize('sogn',17)
					addLuaText('sogn');
					setTextSize('daVer',17)
					addLuaText('daVer');
      end
end
local diff = 'lol'
function onCreatePost()
  if usehud then
    addLuaScript('scripts/nope/ECR Forever')
  setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
  setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
  setProperty('camZooming',true)
  if difficulty == 0 then
    diff = 'EASY'
  elseif difficulty == 1 then
    diff = 'NORMAL'
  elseif difficulty == 2 then
    diff = 'HARD'
  end
  setTextString('sogn',songName..' - '..diff)
  setProperty('timeBarBG.visible',false)
  setProperty('timeBar.visible',false)
  setProperty('timeTxt.visible',false)
  setProperty('scoreTxt.visible',false)
end
end
local theduckingRating = "N/A"
function onUpdate()
  if ratingName == '?' then
    theduckingRating = "F"
  elseif ratingName == 'You Suck!' then
    theduckingRating ='Dude for real?'
  elseif ratingName == 'Shit' then
    theduckingRating ='CLEAR'
  elseif ratingName == 'Bad' then
    theduckingRating ='F'
  elseif ratingName == 'Bruh' then
    theduckingRating ='E'
  elseif ratingName == 'Meh' then
    theduckingRating ='D'
  elseif ratingName == 'Nice' then
    theduckingRating ='C'	
  elseif ratingName == 'Good' then
    theduckingRating ='B'
  elseif ratingName == 'Great' then
    theduckingRating ='A'
  elseif ratingName == 'Sick!' then
    theduckingRating ='S'
  elseif ratingName == 'Perfect!!' then
    theduckingRating ='S+'
  elseif botPlay == true then
    theduckingRating ='?'
  end
if usehud then
  setTextString('newScoreAcc','Score: '..score..' - Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%'..' [' .. ratingFC .. ']'..' - Combo Breaks: '..misses..' - Rank: '..theduckingRating)
end
end
local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 25
local velocity = 1.35
function onMoveCamera(focus)
  if usehud then
     if focus == 'boyfriend' then
     campointx = getProperty('camFollow.x')
     campointy = getProperty('camFollow.y')
     bfturn = true
     setProperty('cameraSpeed', 1.6)
     elseif focus == 'dad' then
     campointx = getProperty('camFollow.x')
     campointy = getProperty('camFollow.y')
     bfturn = false
     setProperty('cameraSpeed', 1.6)
     end
    end
 end

  
function onBeatHit()
  if usehud then
  if curBeat % 1 == 0 then
    setProperty('iconP1.scale.x',1.15)
    setProperty('iconP2.scale.x',1.15)
    doTweenX('icon','iconP1.scale',1,0.15,'circOut')
    doTweenX('icon1','iconP2.scale',1,0.15,'circOut')
end
end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
  if usehud then
if not bfturn then
  if direction == 0 then
      setProperty('camFollow.x', campointx - camMovement)
  elseif direction == 1 then
      setProperty('camFollow.y', campointy + camMovement)
  elseif direction == 2 then
      setProperty('camFollow.y', campointy - camMovement)
  elseif direction == 3 then
      setProperty('camFollow.x', campointx + camMovement)
  end
  setProperty('cameraSpeed', velocity)
end
end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
  if usehud then
  if bfturn then
    if direction == 0 then
        setProperty('camFollow.x', campointx - camMovement)
    elseif direction == 1 then
        setProperty('camFollow.y', campointy + camMovement)
    elseif direction == 2 then
        setProperty('camFollow.y', campointy - camMovement)
    elseif direction == 3 then
        setProperty('camFollow.x', campointx + camMovement)
    end
    setProperty('cameraSpeed', velocity)
end
end
end