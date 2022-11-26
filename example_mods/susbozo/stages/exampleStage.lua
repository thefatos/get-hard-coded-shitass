local shadname = "wavy"
function onCreatePost()
        initLuaShader(shadname)
    
    makeLuaSprite("grapshad")
    makeGraphic("grapshad", screenWidth, screenHeight)
        setSpriteShader("grapshad", shadname)
        addHaxeLibrary("ShaderFilter", "openfl.filters")
        
    runHaxeCode([[
	game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("grapshad").shader)]);
    ]])  
end

function wavytime(xwave,ywave,xtime,ytime)
	setShaderFloat('grapshad','xwave',xwave)
	setShaderFloat('grapshad','ywave',ywave)
	setShaderFloat('grapshad','xtime',xtime)
	setShaderFloat('grapshad','ytime',ytime)
end
function onUpdatePost(elapsed)
		wavytime(7,5,7,5)
    setShaderFloat("grapshad", "iTime", os.clock())
end

function onCreate()
	makeLuaSprite('bones', 'bones', -600, -300)
    setLuaSpriteScrollFactor('bones', 0.8, 0.8);
    scaleObject('bones', 1, 1);
    addLuaSprite('bones', false);
    initLuaShader('grapshad')
    setSpriteShader('bones', 'wavy')
end

function onUpdate()

setShaderFloat('bones', 'iTime', os.clock()) 
	
end