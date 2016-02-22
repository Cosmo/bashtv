# bashtv
*Created at #PulsHackDays 2015*

## Dependencies
- [libcaca](http://caca.zoy.org/)
- [mplayer](https://www.mplayerhq.hu/)
- [Swift](https://swift.org/download/#latest-development-snapshots)

**Note that the latest mplayer does not link to libcaca (at least on Mac OS)**

### On Mac
```
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install libcaca
# brew install mplayer --with-libcaca
```

## Build
Simply run `swift build` in the root directory of this project

## Run
`./.build/debug/bashtv`

### Options
- `-c` `--channel` : Filter Channel name
- `-b` `--broadcast` : Filter Broadcast name
- `-s` `--stream` : Stream by Broadcast ID
