//
//  PlayerViewVC.swift
//  TrabajoFCT
//
//  Created by Apps2M on 16/2/23.
//
import UIKit
import youtube_ios_player_helper

class PlayerViewVC: UIViewController {
    
    @IBOutlet var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: "ZCMSNYuaUZw")
        
    }
    
}

