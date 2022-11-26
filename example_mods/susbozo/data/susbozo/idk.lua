
local ffi = require("ffi")
local user32 = ffi.load("user32")
ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_ICONERROR = 0x00000010L,
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
]])

function onCreate()
            
            user32.MessageBoxA(
                nil,
                "Cheater found.",
                "Why are you cheating.",
                ffi.C.MB_OK + ffi.C.MB_ICONERROR
            )

            user32.MessageBoxA(
                nil,
                "Anti-cheat is loading.",
                "Anti-cheat",
                ffi.C.MB_OK + ffi.C.MB_ICONERROR
            )

            user32.MessageBoxA(
                nil,
                "Have fun.",
                ">:)",
                ffi.C.MB_OK + ffi.C.MB_ICONERROR
            )
            
end