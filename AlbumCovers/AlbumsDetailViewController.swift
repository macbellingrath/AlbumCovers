//
//  AlbumsViewController.swift
//  AlbumCovers
//
//  Created by Mac Bellingrath on 10/14/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import AFNetworking

class AlbumDetailViewController: UIViewController {
    
    var albumInfo: Album!
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var tracksTableView: UITableView!
    
    let tracksData = TracksDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
                
        
        albumNameLabel.text = albumInfo.albumName
        albumImageView.image = albumInfo.albumImage ?? albumInfo.getImage()
        albumImageView.contentMode = .ScaleAspectFit
        
        tracksTableView.dataSource = tracksData
        
        if let _albumid = albumInfo.albumID {
            
            print(_albumid)
            tracksData.findTracksForAlbum("\(_albumid)") { () -> () in
                
                //update tableView
                self.tracksTableView.reloadData()
                
            }
            
            
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
}


class TracksDataSource: NSObject, UITableViewDataSource {
    
    var tracks: [Track] = []
    
    
    //MARK: - Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as! TrackCell
        
        //subscript to obtain track
        let track = tracks[indexPath.row]
        
        cell.trackInfo = track
        
        cell.trackNameLabel?.text = track.trackName
        
        
        return cell
        
        
    }
    //MARK: - Networking Code
    
    let requestManager = AFHTTPRequestOperationManager()
    
    func findTracksForAlbum(albumID: String, completion: () -> ()) {
        
        
        tracks = []
        let urlString = "https://itunes.apple.com/lookup?id=\(albumID)&entity=song"
        
        
        requestManager.GET(urlString, parameters: nil, success: { (operation, data) -> Void in
            
            
            if let foundInfo = data as? Dictionary {
                if let results = foundInfo["results"] as? [Dictionary] {
                    for result in results {
                        if result["trackName"] != nil {
                            let track = Track(info: result)
                            self.tracks.append(track)
                        }
                        
                    }
                    
                    completion()
                    
                }
                
            }
            
            
            print(data)
            
            //do something with data
            
            }) { (operation, error) -> Void in
                
                print(error)
        }
        
        
    }
    
}


