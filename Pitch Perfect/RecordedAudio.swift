//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by ROHIT GUPTA on 6/1/15.
//  Copyright (c) 2015 ROHIT GUPTA. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(title: String, filePathUrl: NSURL)
    { // constructor
        self.title = title
        self.filePathUrl = filePathUrl
    }
}
