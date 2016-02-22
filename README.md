```
dP                         dP       M''''''''M M''MMMMM''M    
88                         88       Mmmm  mmmM M  MMMMM  M    
88d888b. .d8888b. .d8888b. 88d888b. MMMM  MMMM M  MMMMP  M    
88'  `88 88'  `88 Y8ooooo. 88'  `88 MMMM  MMMM M  MMMM' .M    
88.  .88 88.  .88       88 88    88 MMMM  MMMM M  MMP' .MM    
88Y8888' `88888P8 `88888P' dP    dP MMMM  MMMM M     .dMMM    
                                    MMMMMMMMMM MMMMMMMMMMM    
```
*Created at [#PulsHackDays](http://www.pulshackdays.de/) 2015*

## Dependencies
- [libcaca](http://caca.zoy.org/)
- [mplayer](https://www.mplayerhq.hu/)
- [Swift](https://swift.org/download/#latest-development-snapshots)

**Note that the latest mplayer does not link to libcaca by default (at least on Mac OS)**

### On Mac
```
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install libcaca
# brew install mplayer --with-libcaca
```

## Build
Simply run `swift build` in the root directory of this project

## Run
`.build/debug/bashtv`

### Options
- `-c` `--channel` : Filter Channel name
- `-b` `--broadcast` : Filter Broadcast name
- `-s` `--stream` : Stream by Broadcast ID
