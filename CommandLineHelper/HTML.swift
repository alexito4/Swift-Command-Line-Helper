//
//  HTML.swift
//  TestCL
//
//  Created by Alejandro Martinez on 07/09/14.
//  Copyright (c) 2014 Alejandro Martinez. All rights reserved.
//

import Foundation

enum HTMLTag : String {
    case Unknown            = ""
    case Link               = "href"
    case Paragraph          = "p"
    case List               = "li"
    case ListItem           = "ui"
    case Image              = "image"
}

class HTMLParser {
    
    let document: NSXMLDocument
    
    init(html: String) {
        var error: NSError?
        self.document = NSXMLDocument(XMLString: html, options: kNilOptions, error: &error)
        println(error?)
    }
    
    
}