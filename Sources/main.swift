import Foundation
import Rainbow

print("    .########.....###.....######..##.....##.########.##.....##    ".red.bold.blink)
print("    .##.....##...##.##...##....##.##.....##....##....##.....##    ".red.bold.blink)
print("    .##.....##..##...##..##.......##.....##....##....##.....##    ".red.bold.blink)
print("    .########..##.....##..######..#########....##....##.....##    ".red.bold.blink)
print("    .##.....##.#########.......##.##.....##....##.....##...##.    ".red.bold.blink)
print("    .##.....##.##.....##.##....##.##.....##....##......##.##..    ".red.bold.blink)
print("    .########..##.....##..######..##.....##....##.......###...    ".red.bold.blink)

if let
  linesString   = "tput li".call(),
  columnsString = "tput co".call(),
  lines         = linesString.digitsOnly(),
  columns       = columnsString.digitsOnly()
{
  print(lines)
  print(columns)
}
