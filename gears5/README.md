
## WARNING

I have no idea if using this or any other autohotkey script while playing online is a bannable offense or not. I would only recommend playing private Campaign mode with it, as that is the only use-case which I have used it for.

## Description

If you are on Windows 7 and have certain hardware. Or perhaps only one of those two conditions, you may get error message pop-ups ("MsgBoxes" in programming lingo) about DXGIGetDebugInterface1 or GW50x errors or other similar things.

In my case, I get these errors on a PC running Windows 7 Pro x64 w/ SP1 and all updates through Windows 7 EOL. It has an [AMD 9590](https://www.newegg.com/amd-fx-series-fx-9590/p/N82E16819113351) CPU, 32 GB RAM, and a NVIDIA Geforce [GTX 970](https://www.amazon.com/gp/product/B00NN0GEXQ?psc=1) graphics card with 4GB GDDR5 VRAM. A little dated but works great for most things. But presumably due to some limitation in the Windows 7 DX12 framework or Gears itself, it gives me a lot of crap about using this graphics card on Windows 7 (despite the fact that it is the exact model listed as the "recommended" card for Windows 10 on the [Steam store page](https://store.steampowered.com/app/1097840/Gears_5/)).

The error MsgBoxes pop-up every time I launch the game and on the rare occasions that I actually get a crash to desktop, I sometimes get them again. But the thing is, **I am not actually blocked from playing** so they are purely just a nuisance albeit a constant nuisance. I was actually able to play on High quality without any issues during game-play but eventually went to Low quality bc of a couple of spots that would CTD during *cutscenes*. Specifically, the cutscenes at the end of Act 1, Chapter 1 and Act 2, Chapter 5 were the worst in this regard.

Anyway, since I was sick of clicking OK to dismiss 3 seperate pop-ups each and every time I launched the game, I wrote an [autohotkey](https://www.autohotkey.com/) script to do it for me. If you aren't familiar with autohotkey, I will mention that while open-source, their versioning system can be a tad confusing for new-comers. My script will only work with the v1.1 series (which is listed as the "Current Version" on their site as of time of writing, Oct 2020).

## WARNING

In case you missed it the first time:

I have no idea if using this or any other autohotkey script while playing online is a bannable offense or not. I would only recommend playing private Campaign mode with it, as that is the only use-case which I have used it for.

## DISCLAIMER

This script is not for "cheating" unless you consider clicking OK 3 times to dismiss annoying messages to be cheating. That said, I don't encourage cheating on any online or multiplayer games but am of the opinion that single-player is for your exclusive enjoyment so who cares. But realize that if you do run into problems with it, it is a risk that you implicitly accept by running the script so it's your problem and I take no responsibility.

So if you get banned, the script doesn't work, your kitten starts on fire, or you have issues, it is **your** fault and I assume no liability whatsoever.

In the event that it just doesn't work, feel free to leave a bug report and I may or may not look into it (not trying to be a jerk but I have a life too and even when I'm on a PC, I don't even use Windows that often).

## USAGE

1. Install Autohotkey v1.1.x (*not* v1.0.x and *not* v2.x) - it should be listed as the current version on the official [autohotkey](https://www.autohotkey.com/) site.
2. Clone my repo *or* download and extract my repo *or* view and save thee raw-source of my script to your hard-drive
3. Double-click to run *or* right-click and choose Open (if prompted for what to open with, browse and select "C:\Program Files\AutoHotkey\AutoHotkey.exe").

The script is designed to run in the background and continuously monitor for the error messages and dismiss them shortly after they are detected. If you have created a desktop shortcut for Gears 5, then pressing `Ctrl+Shift+R` will run the game. Otherwise, if you do not have a desktop shortcut for the game, the script will helpfully give you another error message when you press this key combination.

If you want to close it, any of the following 4 ways should work:

1. Script defines the hotkey `Ctrl+Shift+Backspace` to close itself
2. Look for a green system tray icon with a white "H" then right-click it and choose Exit.
3. From Task Manager/Process Explorer/etc, you can kill the AutoHotKey.exe process.
4. Rebooting Windows closes all processes including this script.



