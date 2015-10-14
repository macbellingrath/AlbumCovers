//
//  TrackCell.swift
//  AlbumCovers
//
//  Created by Mac Bellingrath on 10/14/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import SVGPlayButton
import AVFoundation
import SafariServices

class TrackCell: UITableViewCell {
    
    var trackInfo: Track! {
        didSet {
            
            if let price = trackInfo.trackPrice {
           
                buyButton.setTitle("\(price)" , forState: .Normal)
            }
        }
    }

    
    @IBOutlet weak var trackNameLabel: UILabel!
    
    @IBOutlet weak var playButton: SVGPlayButton!
    
    @IBAction func playButtonPressed(sender: SVGPlayButton) {
        
        print("Pressed")
    }
    
    @IBOutlet weak var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playButton.progressTrackColor = UIColor.lightGrayColor()
        playButton.progressColor = UIColor.orangeColor()
        playButton.playColor = UIColor.orangeColor()
        playButton.pauseColor = UIColor.orangeColor()
        
        playButton.willPlay = { self.willPlayHandler() }
        playButton.willPause = { self.willPauseHandler() }
      
    }
    @IBAction func buyButtonPressed(sender: UIButton) {
        
        if let urlStr =  trackInfo.trackViewURL {
            if let url = NSURL(string: urlStr) {
                
               UIApplication.sharedApplication().openURL(url)
                
            }
        }
        
    }
    
    //Play Audio
    var player: AVAudioPlayer?
    
    private func willPlayHandler() {
        
        if let data = trackInfo.mediaData ?? trackInfo.getMedia() {
      
        player = player ?? (try? AVAudioPlayer(data: data))
        
        }
        
        print("willPlay")
        player?.play()
    }
    
    private func willPauseHandler() {
        print("willPause")
        player?.pause()
    }
}
