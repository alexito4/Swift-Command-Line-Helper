//
//  main.swift
//  TestCL
//
//  Created by Alejandro Martinez on 07/09/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Foundation

println(CLH.currentDirectoryPath())
CLH.changeToHome()
println(CLH.currentDirectoryPath())
CLH.changeToDesktop()
println(CLH.currentDirectoryPath())

let testPath = CLH.currentDirectoryPath() + "/test"
CLH.createDirectoryAtPath(testPath)
CLH.changeToDirectory(testPath)
println(CLH.currentDirectoryPath())


for i in 1...5 {
    CLH.touchFile("test\(i).txt")
}

CLH.renameFileWithName("test1.txt", toName: "testOne.txt")

// Change the names of files
for (i, file) in enumerate(CLH.contentsOfDirectoryAtPath(testPath)) {
    println(file)
}


let textPath = testPath + "/text.txt"
let text = "Some interesting text"
CLH.writeText(text, atPath: textPath)
CLH.printFileAtPath(textPath)

// HTML Scripting

//
//let url = NSURL(string: "http://www.alejandromp.com/blog/")
//let page = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
//page.writeToFile(testPath + "/index.html", atomically: true)
//
//let content = NSString(data: page, encoding: NSUTF8StringEncoding)
////println(content)
//
//let html = HTMLParser(html: content)
//
//var error: NSError?
//let result = html.document.objectsForXQuery("//", error: &error)
//println("Error \(error)")
//println(result)















