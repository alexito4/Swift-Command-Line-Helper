//
//  Files.swift
//  TestCL
//
//  Created by Alejandro Martinez on 07/09/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Foundation

typealias CLH = CommandLineHelper

private let fileManager = NSFileManager.defaultManager()

class CommandLineHelper {
    
}

extension CommandLineHelper {
    class func currentDirectoryPath() -> String {
        return fileManager.currentDirectoryPath
    }
    
    class func changeToHome() {
        changeToDirectory(NSHomeDirectory())
    }
    
    class func changeToDesktop() {
        changeToDirectory(NSHomeDirectory() + "/Desktop")
    }
    
    class func changeToDirectory(directory: String) {
        fileManager.changeCurrentDirectoryPath(directory)
    }
}

extension CommandLineHelper {
    class func createDirectoryAtPath(path: String) {
        fileManager.createDirectoryAtPath(path, withIntermediateDirectories: true, attributes: nil, error: nil)
    }
    
    class func contentsOfDirectoryAtPath(path: String) -> [String] {
        let url = NSURL(string: path)
        let contents = fileManager.contentsOfDirectoryAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, error: nil)
        
        if let contents = contents {
            return contents.map {
                (let o) -> String in
                let s = o as NSURL
                return s.relativePath!
            }
        }
        
        return []
    }
}

extension CommandLineHelper {
    class func touchFile(name: String) {
        touchFileAtPath(currentDirectoryPath() + "/" + name)
    }
    
    class func touchFileAtPath(path: String) {
        fileManager.createFileAtPath(path, contents: nil, attributes: nil)
    }
    
    class func renameFileWithName(name: String, toName: String) {
        let origin = currentDirectoryPath() + "/" + name
        let newPath = currentDirectoryPath() + "/" + toName
        moveItemAtPath(origin, toPath: newPath)
    }
    
    class func moveItemAtPath(origin: String, toPath: String) -> (Bool, NSErrorPointer) {
        var error = NSErrorPointer()
        let moved = fileManager.moveItemAtPath(origin, toPath: toPath, error: error)
        return (moved, error)
    }
}

extension CommandLineHelper {
    class func readTextFromPath(path: String) -> String? {
        return String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
    }
    
    class func writeText(text: String, atPath: String) {
        text.writeToFile(atPath, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
    }
    
    class func printFileAtPath(path: String) {
        let text = readTextFromPath(path)
        if let text = text {
            println(text)
        }
    }
}

