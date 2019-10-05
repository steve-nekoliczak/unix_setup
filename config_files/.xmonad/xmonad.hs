import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks(ToggleStruts(..),avoidStruts,docks,manageDocks)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ docks defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        }
