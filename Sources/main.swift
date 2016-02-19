import Foundation
import Rainbow
import Gloss
import Environment

func call(call: String) -> String? {
  let task = NSTask()
  task.launchPath = "/bin/sh"
  task.arguments = ["-c", call]

  let pipe = NSPipe()
  task.standardOutput = pipe
  task.launch()
  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  var outputString: String?
  if let output = NSString(data: data, encoding: NSUTF8StringEncoding) {
      outputString = output as String
  }
  task.waitUntilExit()
  return outputString
}
extension String {
  func digitsOnly() -> String? {
    let digitsSet: NSCharacterSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    return (self as NSString).stringByTrimmingCharactersInSet(digitsSet)
  }
}

print("    .########.....###.....######..##.....##.########.##.....##    ".red.bold.blink)
print("    .##.....##...##.##...##....##.##.....##....##....##.....##    ".red.bold.blink)
print("    .##.....##..##...##..##.......##.....##....##....##.....##    ".red.bold.blink)
print("    .########..##.....##..######..#########....##....##.....##    ".red.bold.blink)
print("    .##.....##.#########.......##.##.....##....##.....##...##.    ".red.bold.blink)
print("    .##.....##.##.....##.##....##.##.....##....##......##.##..    ".red.bold.blink)
print("    .########..##.....##..######..##.....##....##.......###...    ".red.bold.blink)


if let
  linesString   = call("tput li"),
  columnsString = call("tput co"),
  lines         = linesString.digitsOnly(),
  columns       = columnsString.digitsOnly()
{
  print(lines)
  print(columns)
}
