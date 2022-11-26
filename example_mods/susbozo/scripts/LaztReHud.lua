local usehud = true    --set to true if you wanna use this

-- [-Config-] --
local notebop = true
local stats = true
local hdrain = true
local showhudver = true
local camfol = true 
-- [-Info-] --
--[[ 
    notebop: When true note will boping as the direction goes (Doesnt Support Modchart! Better Disable this if you want Your Modchart Works perfectly)
    stats: When true a text will show all the sicks,goods,bads,shits you have and are you on storymode or freeplay
    hdrain: When true opponent also drains your health when hitting note
    watermark: When true it will show engine ver
    showhudver: When true it will show my hud ver
    camfol: When true the camera will follow the direction on note (exam: left the camera moving a little to left and then goes back to center)
]]



--[[ 
⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⠄⠄⠄⠄⠄⣀⣀⣐⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄
⠄⠄⢠⠄⣠⣶⣿⣿⣿⠿⠿⣛⣂⣀⣀⡒⠶⣶⣤⣤⣬⣀⡀⠄⢀⠄⠄⠄⠄⠄⠄⠄
⠄⠄⢀⣾⣿⣿⣿⡟⢡⢾⣿⣿⣿⣿⣿⣿⣶⣌⠻⣿⣿⣿⣿⣷⣦⣄⡀⠄⠄⠄⠄⠄
⠄⠄⣈⣉⡛⣿⣿⣿⡌⢇⢻⣿⣿⣿⣿⣿⠿⠛⣡⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠄⠄⠄
⠄⠺⠟⣉⣴⡿⠛⣩⣾⣎⠳⠿⠛⣋⣩⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠄⠄
⠄⠄⠄⠘⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄
⠄⠄⢀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠄
⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣀
⠄⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠘⠛
⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⣀⣀⣠⣤
⠄⠄⣀⣀⡙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣩⠤⠾⠄⠛⠋⠉⢉
⠄⠺⠿⠛⠛⠃⠄⠉⠙⠛⠛⠻⠿⠿⠿⠟⠛⠛⠛⠉⠁⠄⠄⣀⣀⣠⣤⣠⣴⣶⣼⣿



- Laztrix

]]



----------------- [-The Core-] ------------------
--variable
local lazver = '4.20'
local lazx = '1110'
local dadsingL = 4
local bfsingL = 4
local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 17
local velocity = 1.42
		realAnimdad = 'idle'
		realAnimbf = 'idle'
local separation
local receptorSep = 160 -- how much of pixels do you want each note to distance
local receptorSize = 0.63 -- note size


local strumPosY
cmoffset = -4
cmy = 20
tnhx = -5
veloY = 0
-- core
function onCreate()
if usehud then
--timer section
   -- makeLuaText("songTimer",'',0,15,0); ---- disabled for now.
   -- addLuaText('songTimer');
    --setTextBorder("songTimer", 1, '000001')
    --setTextSize('songTimer',20);
--stats section
if stats then
    if downscroll then
        veloY = -30
      else
        veloY = 400
    end
    makeLuaText("tnh", '', 250, tnhx, veloY);
    makeLuaText("cm", '', 200, -getProperty('tnh.x') + cmoffset, getProperty('tnh.y') + cmy);
    makeLuaText("sick", 'Sicks!: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
    makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
    makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
    makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
    addLuaText('tnh');
    setTextBorder("sick", 1, '000001')
    setTextBorder("good", 1, '000001')
    setTextBorder("shit", 1, '000001')
    setTextBorder("bad", 1, '000001')
    setTextSize('sick', 20);
    addLuaText("sick");
    setTextAlignment('sick', 'left')
    setTextSize('good', 20);
    addLuaText("good");
    setTextAlignment('good', 'left')
    setTextSize('bad', 20);
    addLuaText("bad");
    setTextAlignment('bad', 'left')
    setTextSize('shit', 20);
    addLuaText("shit");
    setTextAlignment('shit', 'left')
    makeLuaText('theRating','?',0,5,getProperty('shit.y')+ 30);
    setTextBorder("theRating", 1, '000001')
    setTextSize('theRating',20);
    addLuaText('theRating');
    setTextAlignment('theRating', 'left');

    makeLuaText('stor', '', 0,1152, 675);
        setTextBorder("stor", 1, '000001')
        setTextAlignment('stor', 'right');
        setTextSize('stor',19)
        addLuaText('stor');
        if isStoryMode then
            setTextString('stor','(StoryMode)');
            else
            setTextString('stor',' (FreePlay)');
           end
end
--a new text that replace the old text section
    makeLuaText('newScoreAcc','hey vsauce here',1000, 140, 0);
    setTextBorder("newScoreAcc", 1, '000001')
    setTextSize('newScoreAcc',20);
-- watermark section

    makeLuaText('sogn', songName, 0, 3, 680);
    makeLuaText('stor', '', 0,1152, 675);
  
        setTextBorder("sogn", 1, '000001')
        setTextAlignment('sogn', 'left');
        setTextSize('sogn',20)
        setTextColor('sogn', 'E5E7E9');
        addLuaText('sogn');
        addLuaText('newScoreAcc');
        
       if showhudver then
       makeLuaText('daHudVer', 'Walter!HUD '..lazver, 0,lazx, 698);
       end
       if not showhudver and stats then
        setProperty('stor.y',698)
       end
       makeLuaText('daVer','Psych Engine '.. getPropertyFromClass('MainMenuState', 'psychEngineVersion'),0,3,698);
    addLuaText('daVer');
    addLuaText('daHudVer');
    setTextBorder("daVer", 1, '000001')
    setTextBorder("daHudVer", 1, '000001')
    end
end
function onCreatePost()
    sgname = songName
--properties
if usehud then
    addLuaScript('scripts/nope/ECR Lazt')
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.8)
    end
    separation = screenWidth / 4

	strumPosY = screenHeight / 6
	if downscroll then strumPosY = screenHeight / 1.25 end

	resizeStrumline('opponent', screenWidth / 2 - separation, strumPosY, receptorSize, receptorSep)
	resizeStrumline('player', screenWidth / 2 + separation, strumPosY, receptorSize, receptorSep)
    for i = 0,7 do
        if downscroll then
            setPropertyFromGroup('strumLineNotes',i,'y',570)
        else
            setPropertyFromGroup('strumLineNotes',i,'y',30)
        end
    end
    --

    setProperty('timeBar.color',getColorFromHex('00C2FB'))
    setProperty('scoreTxt.visible',false)
    setProperty('timeTxt.visible',false)
    setProperty('healthBarBG.scale.x',1.2)
    setProperty('healthBar.scale.x',1.2)
    setProperty('healthBar.x',280)
    updateHitbox('healthBar')
    updateHitbox('healthBarBG')
    if downscroll then
        yValuebotPlay = 50;
        setProperty('healthBar.y', 50)
        setProperty('iconP1.y', -5)
        setProperty('iconP2.y', -5)
        setProperty('scoreTxt.y',80)
        setProperty('songTimer.y', getProperty('theRating.y') + 5)
    else
        yValuebotPlay = -120
         setProperty('scoreTxt.y',690)
         setProperty('healthBar.y', 670)
         setProperty('iconP1.y', 585)
         setProperty('iconP2.y', 585)
    end
 
end
end
function onCountdownTick(counter)
if usehud then
    if counter == 0 then
        characterPlayAnim('dad','idle',true)
        characterPlayAnim('boyfriend','idle',true)
    end
    if counter == 1 then
        characterPlayAnim('dad','idle',true)
        characterPlayAnim('boyfriend','idle',true)
    end
    if counter == 2 then
        characterPlayAnim('dad','idle',true)
        characterPlayAnim('boyfriend','idle',true)
        cameraSetTarget("boyfriend")
    end
    if counter == 3 then
        cameraSetTarget("boyfriend")
        characterPlayAnim('dad','idle',true)
        characterPlayAnim('boyfriend','hey',true)
        characterPlayAnim('gf','cheer',true)
    end
end
end
function onSongStart()
    for i = 0,7 do
notespoint = getPropertyFromGroup('strumLineNotes',i,'y')
    end
end
function onMoveCamera(focus)
    if usehud then
	if focus == 'boyfriend' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = true
	elseif focus == 'dad' then
	campointx = getProperty('camFollow.x')
    campointy = getProperty('camFollow.y')
	bfturn = false
	setProperty('cameraSpeed', 1.6)
	end
end
end

function onUpdatePost()
    if usehud then
    
    if getProperty('dad.animation.curAnim.name') == 'idle' then
		if getProperty('dad.animation.curAnim.finished') then
            characterPlayAnim("dad","idle",true)
		end
	end
    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		if getProperty('boyfriend.animation.curAnim.finished') then
            characterPlayAnim("boyfriend","idle",true)
		end
	end
    if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
		if getProperty('dad.animation.curAnim.finished') then
            characterPlayAnim("dad","idle-alt",true)
		end
	end
    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
		if getProperty('boyfriend.animation.curAnim.finished') then
            characterPlayAnim("boyfriend","idle-alt",true)
		end
	end
    setObjectOrder('songTimer',getObjectOrder('timeTxt'))
   -- setObjectOrder('newScoreAcc',getObjectOrder('scoreTxt'))
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.V') then
        if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
            loadSong(sgname,'hard')
            setPropertyFromClass('ClientPrefs', 'downScroll',false)
        else
            loadSong(sgname,'hard')
            setPropertyFromClass('ClientPrefs', 'downScroll',true)
        end
    end
end
end
function onUpdate(elapsed)
if usehud then
    
    setProperty('songTimer.angle',getProperty('timeTxt.angle'))
    setProperty('songTimer.alpha',getProperty('timeTxt.alpha'))
    setTextString('songTimer',"" .. milliToHuman(math.floor(songLength - (getPropertyFromClass('Conductor', 'songPosition') - noteOffset))) .. "")
    if stats then
        setTextString('sick', 'Sick!: ' .. getProperty('sicks'))
        setTextString('good', 'Goods: ' .. getProperty('goods'))
        setTextString('bad', 'Bads: ' .. getProperty('bads'))
        setTextString('shit', 'Shits: ' .. getProperty('shits'))
    end
    setTextString('theRating','[' .. ratingFC .. ']')
    setProperty('newScoreAcc.y',getProperty('scoreTxt.y'))
    setTextString('newScoreAcc','Score: '..score..' | Note Missed: '..misses..' | Accuracy: '..round((getProperty('ratingPercent') * 100), 2) ..'%')
end
end


function iconBeat(uno) 
    local icbeat = (60/curBpm)
    if uno == 'reverse card' then
        scaleObject('iconP1',1.14,1.14)
        scaleObject('iconP2',1.14,1.14)
        doTweenX('uc','iconP1.scale',1,0.3,'sineOut')
        doTweenY('uce','iconP1.scale',1,0.3,'sineOut')
        doTweenX('ucs','iconP2.scale',1,0.3,'sineOut')
        doTweenY('uces','iconP2.scale',1,0.3,'sineOut')
    end
    if uno == 'draw 25' then -- nothing yet
       
    end
end
function onBeatHit()
if usehud then
   
   if curBeat % 1 == 0 then
    iconBeat('reverse card')
        setProperty('timeTxt.angle',1*-10)
        doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
     
    end
    if curBeat % 2 == 0 then
        setProperty('timeTxt.angle',1*10)
        doTweenAngle('ho','timeTxt', 0, 0.2, 'quadInOut')
        
    end
end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if usehud then
    if camfol then
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
    if notebop then
        if downscroll then
            if direction == 0 then
            setPropertyFromGroup('strumLineNotes', 4, 'y', notespoint + 23)
            noteTweenY('lol', 4, notespoint, 0.2 ,"quartOut")
         elseif direction == 1 then
            setPropertyFromGroup('strumLineNotes', 5, 'y', notespoint + 23)
            noteTweenY('lol2', 5, notespoint, 0.2 ,"quartOut")
         elseif direction == 2 then
            setPropertyFromGroup('strumLineNotes', 6, 'y', notespoint + 23)
            noteTweenY('lol3', 6, notespoint, 0.2 ,"quartOut")
         elseif direction == 3 then
            setPropertyFromGroup('strumLineNotes', 7, 'y', notespoint + 23)
            noteTweenY('lol4', 7, notespoint, 0.2 ,"quartOut")
         end
        end
           if not downscroll then
            if direction == 0 then
                setPropertyFromGroup('strumLineNotes', 4, 'y', notespoint - 23)
                noteTweenY('lol', 4, notespoint, 0.2 ,"quartOut")
             elseif direction == 1 then
                setPropertyFromGroup('strumLineNotes', 5, 'y', notespoint - 23)
                noteTweenY('lol2', 5, notespoint, 0.2 ,"quartOut")
             elseif direction == 2 then
                setPropertyFromGroup('strumLineNotes', 6, 'y', notespoint - 23)
                noteTweenY('lol3', 6, notespoint, 0.2 ,"quartOut")
             elseif direction == 3 then
                setPropertyFromGroup('strumLineNotes', 7, 'y', notespoint - 23)
                noteTweenY('lol4', 7, notespoint, 0.2 ,"bounceOut")
           end
         end
      end
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if usehud then
        if hdrain then
            if getProperty('health') > 0.2 then
                setProperty('health',getProperty('health')-0.02)
            end
        end
    if camfol then 
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
    if notebop then
        if downscroll then
         if direction == 0 then
            setPropertyFromGroup('strumLineNotes', 0, 'y', notespoint + 23)
            noteTweenY('lolpart', 0, notespoint, 0.3 ,"quartOut")
         elseif direction == 1 then
            setPropertyFromGroup('strumLineNotes', 1, 'y', notespoint + 23)
            noteTweenY('lolpart2', 1, notespoint, 0.3 ,"quartOut")
         elseif direction == 2 then
            setPropertyFromGroup('strumLineNotes', 2, 'y', notespoint + 23)
            noteTweenY('lolpart3', 2, notespoint, 0.3 ,"quartOut")
         elseif direction == 3 then
            setPropertyFromGroup('strumLineNotes', 3, 'y', notespoint + 23)
            noteTweenY('lolpart4', 3, notespoint, 0.3 ,"quartOut")
         end
        else
            if direction == 0 then
                setPropertyFromGroup('strumLineNotes', 0, 'y', notespoint - 23)
                noteTweenY('lolpart', 0, notespoint, 0.3 ,"quartOut")
             elseif direction == 1 then
                setPropertyFromGroup('strumLineNotes', 1, 'y', notespoint - 23)
                noteTweenY('lolpart2', 1, notespoint, 0.3 ,"quartOut")
             elseif direction == 2 then
                setPropertyFromGroup('strumLineNotes', 2, 'y', notespoint - 23)
                noteTweenY('lolpart3', 2, notespoint, 0.3 ,"quartOut")
             elseif direction == 3 then
                setPropertyFromGroup('strumLineNotes', 3, 'y', notespoint - 23)
                noteTweenY('lolpart4', 3, notespoint, 0.3 ,"quartOut")
             end
         end
    end
end
end
----function that does the other function help
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
    local totalseconds = math.floor(milliseconds / 1000)
    local seconds = totalseconds % 60
    local minutes = math.floor(totalseconds / 60)
    minutes = minutes % 60
    return string.format("%02d:%02d", minutes, seconds)  
end
function getAnim(char,prop)
    prop = prop or 'name'
        return getProperty(char .. '.animation.curAnim.' .. prop)
    
    end
    function resizeStrumline(strum, x_position, y_position, scale, noteSep)
	
        local swagWidth = scale * noteSep
        local isPlayer = false
        if strum == 'player' then isPlayer = true end
    
        for note=0, getProperty(strum..'Strums.length')-1 do
            setPropertyFromGroup(strum..'Strums', note, 'scale.x', scale)
            setPropertyFromGroup(strum..'Strums', note, 'scale.y', scale)
    
            updateHitboxFromGroup(strum..'Strums', note)
    
            local noteX = x_position - swagWidth / 2
            noteX = noteX + (note - (3 / 2)) * swagWidth
    
            setPropertyFromGroup(strum..'Strums', note, 'x', noteX)
            --setPropertyFromGroup(strum..'Strums', note, 'y', y_position)
        end
    
        for note=0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', note, 'mustPress') == isPlayer then
                setPropertyFromGroup('unspawnNotes', note, 'scale.x', scale)
    
                if not getPropertyFromGroup('unspawnNotes', note, 'isSustainNote') then
                    setPropertyFromGroup('unspawnNotes', note, 'scale.y', scale)
                end
                updateHitboxFromGroup('unspawnNotes', note)
            end
        end
    
    end