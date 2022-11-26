
function onSongStart()
    setProperty('boyfriend.visible',false)
           
    -- change window stuff here
    runHaxeCode([[
        windowboyfriend = Application.current.createWindow({
            title: 'boyfriend',
            width: 720,
            height: 600,
            borderless: true,
            alwaysOnTop: true
    
        });]])

		setTransparency(0x000f0f0f)
		runHaxeCode([[
			Application.current.window.focus();
	
			windowboyfriend.stage.color = 0x000f0f0f;
			FlxG.mouse.useSystemCursor = true;
			FlxG.autoPause = false;
	
			]])

    
    --just ignore down below unless you know it
    
    





    
    runHaxeCode([[
        Application.current.window.focus();
    
        FlxG.mouse.useSystemCursor = true;
        FlxG.autoPause = false;
    
        
    
        windowboyfriend.x = 1300;
        windowboyfriend.y = 350;
        boyfriendWin = new Sprite();
        var boyfriendScrollWin = new Sprite();
        windowboyfriend.stage.addEventListener("keyDown", FlxG.keys.onKeyDown);
        windowboyfriend.stage.addEventListener("keyUp", FlxG.keys.onKeyUp);
        var m = new Matrix();


        FlxTween.tween(windowboyfriend, { x: 1600, y: 460 }, 2, {type:FlxTween.PINGPONG, ease: FlxEase.circOut});
    
      
    
        
        boyfriendWin.graphics.beginBitmapFill(game.boyfriend.pixels, m);
        boyfriendWin.graphics.drawRect(0, 0, game.boyfriend.pixels.width, game.boyfriend.pixels.height);
        boyfriendWin.graphics.endFill();
        windowboyfriend.stage.addChild(boyfriendWin);
        boyfriendWin.scaleX = 1;
        boyfriendWin.scaleY = 1;
    
    ]])
    end

    local yourlifeisnothingyouservezeropurposeyoushouldkillyourselfnow = -29292929

    function onDestroy() -- uh fixing uh you know uhhhh
        setTransparency(yourlifeisnothingyouservezeropurposeyoushouldkillyourselfnow)
        runHaxeCode([[
            windowboyfriend.close();  //STOP CRASHING YOU MF
            FlxG.autoPause = true;
           ]])
    end




    function onUpdate(elapsed)
            runHaxeCode([[  
        
                var boyfriendFrame = game.boyfriend._frame;
                
                if (boyfriendFrame == null || boyfriendFrame.frame == null) return; // prevents crashes (i think???)
                    
                var rect = new Rectangle(boyfriendFrame.frame.x, boyfriendFrame.frame.y, boyfriendFrame.frame.width, boyfriendFrame.frame.height);
                
                boyfriendWin.scrollRect = rect;
                boyfriendWin.x = (((boyfriendFrame.offset.x) - (game.boyfriend.offset.x / 2)) * boyfriendWin.scaleX);
                boyfriendWin.y = (((boyfriendFrame.offset.y) - (game.boyfriend.offset.y / 2)) * boyfriendWin.scaleY);   
    
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