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

struct Broadcast {
  let beginsAt: Int
  let endsAt: Int
  let duration: Int
  let title: String
  let channel: String
}



// let channelNameSearch: String? = "ARD"
// let titleSearch: String? = "Fluch"
let nowInSeconds  = Int(NSDate().timeIntervalSince1970)


let cli = CommandLine()

let channelNameSearch = StringOption(shortFlag: "c", longFlag: "channel", helpMessage: "Channel name match")
let titleSearch = StringOption(shortFlag: "b", longFlag: "broadcast", helpMessage: "Broadcast title")
let help = BoolOption(shortFlag: "h", longFlag: "help", helpMessage: "Prints a help message.")
let verbosity = CounterOption(shortFlag: "v", longFlag: "verbose", helpMessage: "Print verbose messages.")

cli.addOptions(channelNameSearch, titleSearch, help, verbosity)

do {
  try cli.parse()
} catch {
  cli.printUsage(error)
  exit(EX_USAGE)
}



let rawBroadcasts = NSURLSession.requestSynchronousJSONWithURLString("https://raw.githubusercontent.com/Cosmo/bashtv-service/master/BashTv.CommandLine/bin/Debug/br.json")
var broadcasts = [Broadcast]()
if let rawBroadcasts = rawBroadcasts as? [[String: AnyObject]] {
  for rawBroadcast in rawBroadcasts {
      if let
        rawBroadcast  = rawBroadcast as? [String: AnyObject],
        beginsAt      = rawBroadcast["start"] as? Int,
        endsAt        = rawBroadcast["end"] as? Int,
        duration      = rawBroadcast["duration"] as? Int,
        title         = rawBroadcast["title"] as? String,
        channel       = rawBroadcast["channel"] as? String
      {
        if
          beginsAt <= nowInSeconds
          &&
          (channelNameSearch.value == nil || (channelNameSearch.value != nil && channel.containsString(channelNameSearch.value!)))
          &&
          (titleSearch.value == nil || (titleSearch.value != nil && title.containsString(titleSearch.value!)))
        {
          let broadcast = Broadcast(beginsAt: beginsAt, endsAt: endsAt, duration: duration, title: title, channel: channel)
          broadcasts.append(broadcast)
        }
      }
  }
}

if let
  linesString   = "tput li".call(),
  columnsString = "tput co".call(),
  lines         = linesString.digitsOnly(),
  columns       = columnsString.digitsOnly()
{
  let timeWidth = 12
  let channelNameWidth = 24
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
  
  for lineData in broadcasts {
      
      var date = NSDate(timeIntervalSince1970: Double(lineData.beginsAt))
      let dateString = dateForm.stringFromDate(date)
      
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
  print(bottom)
  
}

