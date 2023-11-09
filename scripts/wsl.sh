#!/bin/bash
# requires newest wsl version 2
# run powershell as admin and do:
# wsl --update
# wsl --shutdown
sudo apt install libx11-dev libxcomposite-dev libxdamage-dev libxrender-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev -y
sudo apt install xorg -y
sudo apt-get install libghc-x11-dev -y
# maybe only next line instead of lines above
# sudo apt install libxrandr-dev libxinerama-dev libxss-dev -y

# atm cabal needs ghc < 9.4, if you a never version do:
# ghcup install ghc 9.2.5
sudo apt-get update
sudo apt-get install ghc cabal-install -y
cabal update
cabal install --lib base
cabal install --lib HGL
ghci -XNPlusKPatterns fdl.hs -e 'runGraphics (withWindow_ "Test" (1000, 600) (\ w -> drawIt (w, 500, 300, 0, 50) [Forward, RightTurn 90, Forward, RightTurn 90, Forward, RightTurn 90, Forward] >> getKey w))'
