import Foundation
import Environment

extension String {
  func digitsOnly() -> Int? {
    let digitsSet: NSCharacterSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    if let
        digits = Int((self as NSString).stringByTrimmingCharactersInSet(digitsSet))
    {
        return digits
    }
    return nil
  }
  
  func call() -> String? {
    let task = NSTask()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", self]

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
}