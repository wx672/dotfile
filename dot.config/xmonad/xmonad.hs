import XMonad
import System.IO
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run(spawnPipe)

main = do
    xmonad $ def
        { modMask = mod4Mask
          , terminal = "myTerminal"
          , borderWidth = 0
          , focusedBorderColor = "#000000"
          , normalBorderColor = "#888888"
        } `additionalKeysP` myKeys

myFont :: String
myFont = "xft:DejaVu Sans Mono:bold:size=22"

myTerminal :: String
myTerminal = "x-terminal-emulator"

myBrowser :: String
myBrowser = "qutebrowser"

myEmacs :: String
myEmacs = "emacsclient -c -a 'emacs' "

myKeys :: [(String, X ())]
myKeys =
    -- Xmonad
        [ ("M-C-r", spawn "xmonad --recompile")  -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart")    -- Restarts xmonad
        , ("M-p", spawn "dmenu_run -fn \"xft:DejaVu Sans Mono:bold:size=20\" -i -p \"Run: \"") -- Dmenu

    -- Useful programs to have a keybinding for launch
        , ("M-S-<Return>", spawn (myTerminal))
        , ("M-b", spawn (myBrowser))
        , ("M-e", spawn (myEmacs))

    -- Workspaces
        , ("M-S-.", nextScreen)  -- Switch focus to next monitor
        , ("M-S-,", prevScreen)  -- Switch focus to prev monitor

    -- Set wallpaper with 'feh'. Type 'SUPER+F1' to launch sxiv in the wallpapers directory.
    -- Then in sxiv, type 'C-x w' to set the wallpaper that you choose.
        , ("M-<F1>", spawn "sxiv -bq -S2 ~/.keys.png")

    -- Multimedia Keys
        , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5%-")
        , ("<XF86MonBrightnessUp>",   spawn "brightnessctl set +5%")
        , ("<XF86AudioMute>",        spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
        , ("Print", spawn "import -window root /tmp/screenshot-$(date +%Y%m%d%H%M).png")
        , ("M-S-p", spawn "import -window root /tmp/screenshot-$(date +%Y%m%d%H%M).png")
        ]
