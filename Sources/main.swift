import Foundation
import Rainbow

print("    .########.....###.....######..##.....##.########.##.....##    ".red.bold.blink)
print("    .##.....##...##.##...##....##.##.....##....##....##.....##    ".red.bold.blink)
print("    .##.....##..##...##..##.......##.....##....##....##.....##    ".red.bold.blink)
print("    .########..##.....##..######..#########....##....##.....##    ".red.bold.blink)
print("    .##.....##.#########.......##.##.....##....##.....##...##.    ".red.bold.blink)
print("    .##.....##.##.....##.##....##.##.....##....##......##.##..    ".red.bold.blink)
print("    .########..##.....##..######..##.....##....##.......###...    ".red.bold.blink)

struct EPGRow {
  let date: NSDate
  let title: String
  let channel: String
}

let content: [EPGRow] = [
  EPGRow(date: NSDate(), title: "Zoogeschichten von der Küste", channel: "BR"),
  EPGRow(date: NSDate(), title: "Alles was Bayern bewegt", channel: "BR"),
  EPGRow(date: NSDate(), title: "Glückskind", channel: "BR"),
  EPGRow(date: NSDate(), title: "Abenteuer Nordsee - Zwischen Killerwalen und Kegelrobben", channel: "BR"),
  EPGRow(date: NSDate(), title: "Glückskind", channel: "BR")
]


if let
  linesString   = "tput li".call(),
  columnsString = "tput co".call(),
  lines         = linesString.digitsOnly(),
  columns       = columnsString.digitsOnly()
{
  let timeWidth = 11
  let channelNameWidth = 13
  let broadcastTitleWidth = columns - timeWidth - 8 - channelNameWidth
  
  for row in content {
      let date = String(row.date.timeIntervalSince1970).stringByPaddingToLength(timeWidth, withString: " ", startingAtIndex: 0)
      let title = row.title.stringByPaddingToLength(broadcastTitleWidth, withString: " ", startingAtIndex: 0)
      let channel = row.channel.stringByPaddingToLength(channelNameWidth, withString: " ", startingAtIndex: 0)
      print("| \(date)| \(title)| \(channel) |")
  }
}