//
//  Track.swift
//  AlbumCovers
//
//  Created by Mac Bellingrath on 10/14/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class Track: NSObject {
    
    let trackName: String?
    let trackNumber: Int?
    let trackPrice: String?
    let mediaURL: String?
    
    //media
    
    
    
    init(info: Dictionary) {
        trackName = info["trackName"] as? String
        trackNumber = info["trackNumber"] as? Int
        trackPrice = info["trackPrice"] as? String
        mediaURL = info["previewUrl"] as? String
    }
    
}
