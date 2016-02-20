import Foundation
import Rainbow

print("")
print("    dP                         dP       M''''''''M M''MMMMM''M    ")
print("    88                         88       Mmmm  mmmM M  MMMMM  M    ")
print("    88d888b. .d8888b. .d8888b. 88d888b. MMMM  MMMM M  MMMMP  M    ")
print("    88'  `88 88'  `88 Y8ooooo. 88'  `88 MMMM  MMMM M  MMMM' .M    ")
print("    88.  .88 88.  .88       88 88    88 MMMM  MMMM M  MMP' .MM    ")
print("    88Y8888' `88888P8 `88888P' dP    dP MMMM  MMMM M     .dMMM    ")
print("                                        MMMMMMMMMM MMMMMMMMMMM    ")
print("")

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
  let timeWidth = 12
  let channelNameWidth = 18
  let broadcastTitleWidth = columns - timeWidth - channelNameWidth
  
  let top = [
    "┌".stringByPaddingToLength(timeWidth + 2, withString: "─", startingAtIndex: 0),
    "┬".stringByPaddingToLength(broadcastTitleWidth - 4, withString: "─", startingAtIndex: 0),
    "┬".stringByPaddingToLength(channelNameWidth + 1, withString: "─", startingAtIndex: 0),
    "┐"
  ].joinWithSeparator("")
  print(top)
  
  let header = [
    "│ ",
    "Time".stringByPaddingToLength(timeWidth, withString: " ", startingAtIndex: 0).bold,
    "│ ",
    "Name".stringByPaddingToLength(broadcastTitleWidth - 6, withString: " ", startingAtIndex: 0).bold,
    "│ ",
    "Channel".stringByPaddingToLength(channelNameWidth - 1, withString: " ", startingAtIndex: 0).bold,
    "│"
  ].joinWithSeparator("")
  print(header)
  
  let separator = [
    "├".stringByPaddingToLength(timeWidth + 2, withString: "─", startingAtIndex: 0),
    "┼".stringByPaddingToLength(broadcastTitleWidth - 4, withString: "─", startingAtIndex: 0),
    "┼".stringByPaddingToLength(channelNameWidth + 1, withString: "─", startingAtIndex: 0),
    "┤"
  ].joinWithSeparator("")
  print(separator)
  
  let dateForm = NSDateFormatter()
  dateForm.dateFormat = "dd.MM HH:mm"
  
  for lineData in content {
      
      let dateString = dateForm.stringFromDate(lineData.date)
      
      let line = [
        "│ ",
        String(dateString).stringByPaddingToLength(timeWidth, withString: " ", startingAtIndex: 0),
        "│ ",
        lineData.title.stringByPaddingToLength(broadcastTitleWidth - 6, withString: " ", startingAtIndex: 0),
        "│ ",
        lineData.channel.stringByPaddingToLength(channelNameWidth - 1, withString: " ", startingAtIndex: 0),
        "│"
      ].joinWithSeparator("")
      
      print(line)
  }
  
  let bottom = [
    "└".stringByPaddingToLength(timeWidth + 2, withString: "─", startingAtIndex: 0),
    "┴".stringByPaddingToLength(broadcastTitleWidth - 4, withString: "─", startingAtIndex: 0),
    "┴".stringByPaddingToLength(channelNameWidth + 1, withString: "─", startingAtIndex: 0),
    "┘"
  ].joinWithSeparator("")
  

  let resp = NSURLSession.requestSynchronousJSONWithURLString("https://raw.githubusercontent.com/Cosmo/bashtv-service/master/BashTv.CommandLine/bin/Debug/br.json")
  print(resp)
}



