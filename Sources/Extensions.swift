import Foundation
import Environment

extension String {
  func digitsOnly() -> String? {
    let digitsSet: NSCharacterSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
    return (self as NSString).stringByTrimmingCharactersInSet(digitsSet)
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