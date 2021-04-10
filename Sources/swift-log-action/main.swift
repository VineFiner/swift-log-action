 import Logging
 import LoggingGitHubActions
 import class Foundation.ProcessInfo
 
 LoggingSystem.bootstrap { label in
    if ProcessInfo.processInfo.environment["GITHUB_ACTIONS"] == "true" {
        return GitHubActionsLogHandler.standardOutput(label: label)
    } else {
        return StreamLogHandler.standardOutput(label: label)
    }
 }
 
 let logger = Logger(label: "com.example.MyApp")
 logger.info("This is test")
 logger.error("Something went wrong")
 // Prints "::error file=Sources/main.swift,line=5::Something went wrong
 
