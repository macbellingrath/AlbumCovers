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
    let trackPrice: Double?
    let mediaURL: String?
    
    let trackViewURL: String?

    //media
    var mediaData: NSData?
    
    
    init(info: Dictionary) {
        trackName = info["trackName"] as? String
        trackNumber = info["trackNumber"] as? Int
        trackPrice = info["trackPrice"] as? Double
        mediaURL = info["previewUrl"] as? String
        trackViewURL = info["trackViewUrl"] as? String
        
    }
    
    func getMedia() -> NSData? {
        if let mediaDataURL = NSURL(string: mediaURL ?? "") {
            mediaData = NSData(contentsOfURL: mediaDataURL)
            return mediaData
            }
               return nil
        }
        
    
    
   
    
}
