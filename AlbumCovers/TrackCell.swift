//
//  TrackCell.swift
//  AlbumCovers
//
//  Created by Mac Bellingrath on 10/14/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import SVGPlayButton

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var playButton: SVGPlayButton!
    
    @IBAction func playButtonPressed(sender: SVGPlayButton) {
        
        print("Pressed")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playButton.progressTrackColor = UIColor.lightGrayColor()
        playButton.progressColor = UIColor.orangeColor()
        playButton.playColor = UIColor.orangeColor()
        playButton.pauseColor = UIColor.orangeColor()
        
        playButton.willPlay = { self.willPlayHandler() }
        playButton.willPause = { self.willPauseHandler() }
    }
    
    
    private func willPlayHandler() {
        print("willPlay")
    }
    
    private func willPauseHandler() {
        print("willPause")
    }
}
