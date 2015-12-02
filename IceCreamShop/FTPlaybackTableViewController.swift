//
//  FTPlaybackTableViewController.swift
//  IceCreamShop
//
//  Created by user on 12/2/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import UIKit
import DOUAudioStreamer
import MediaPlayer

class FTPlaybackTableViewController: UITableViewController {
  let music_url: [String] =        ["",
                                    "",
                                    ""]
    var play_list: [DOUAudioFile] = [DOUAudioFile]()
    var audio_streamer: DOUAudioStreamer?
    var current_index = 0
    var audio_player_online: AVPlayer?
//    var audio_asset:AVAsset = AVAsset()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let if_mp3_jj = NSBundle.mainBundle().URLForResource("If", withExtension: "mp3");
        let jim_cantin_mp3_lei = NSBundle.mainBundle().URLForResource("JimCantin", withExtension: "mp3")
        let file_item1 = FTAudioStreamItem(fileURL: if_mp3_jj!)
//        file_item1.isLocalFile = true
        let file_item2 = FTAudioStreamItem(fileURL: jim_cantin_mp3_lei!)
        file_item2.isLocalFile = true
        play_list = [file_item1, file_item2]
        var audio_item = AVPlayerItem(URL: file_item1.audioFileURL())
      self.audio_player_online = AVPlayer(playerItem: audio_item)
//      do {
//        try self.audio_player = AVAudioPlayer(contentsOfURL: file_item1.audioFileURL())
//      } catch {
//        
//      }
      UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
      
      let media_playItem = MPMediaItemArtwork(image: UIImage(named: "logo")!)
      let media_center = MPNowPlayingInfoCenter.defaultCenter()
      let playingInfo: [String:AnyObject] = [MPMediaItemPropertyTitle : "Sont Title",
        MPMediaItemPropertyArtist : "Artist Name",
        MPMediaItemPropertyArtwork : media_playItem,
        MPNowPlayingInfoPropertyPlaybackRate : 1.0]
      media_center.nowPlayingInfo = playingInfo

      
//        audio_streamer = DOUAudioStreamer(audioFile: file_item1)
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK:Button Actions
    @IBAction func playOrPause(sender: UIButton) {
      var btn_title = ""
//      if self.audio_player.playing {
//        self.audio_player.pause()
//        //        audio_streamer!.pause()
//        btn_title = "play"
//      } else {
      if let _ = self.audio_player_online {
          self.audio_player_online!.play()
          btn_title = "pause"
      }
//        self.audio_player.play()
//        btn_title = "pause"
//      }
//      switch self.audio_player.playing {
//      case .Playing:
//      case .Paused:
//        self.audio_player.play()
////        audio_streamer!.play()
//        btn_title = "pause"
//      default:
//        self.audio_player.play()
//          btn_title = "pause"
//      }
      sender.setTitle(btn_title, forState: .Normal)
    }
    
    @IBAction func preAction(sender: UIButton) {
        handlePlay(false)
    }
    
    @IBAction func nextAction(sender: UIButton) {
        handlePlay(true)
    }
  
    func handlePlay(isToNext: Bool) {
      
//      self.audio_player.stop()
//      
      isToNext ? current_index++ : current_index--;
      if current_index < 0 {
        current_index = play_list.count - 1
      } else if current_index >= play_list.count {
        current_index = 0
      }
      let audio_file = play_list[current_index]      
      let player_item = AVPlayerItem(URL: audio_file.audioFileURL())
      self.audio_player_online!.replaceCurrentItemWithPlayerItem(player_item)
//      if self.audio_player_online!.status == AVPlayerStatus.ReadyToPlay {
        self.audio_player_online!.play()
//      }
  }

//      do {
//        try self.audio_player = AVAudioPlayer(contentsOfURL: audio_file.audioFileURL())
//          self.audio_player.play()
//      } catch {
//        
//      }
      
//      let cover_url = NSURL(string: "http://img4.duitang.com/uploads/item/201307/12/20130712233702_QmdhA.thumb.600_0.jpeg")
//      dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
//        let cover_data = NSData(contentsOfURL: cover_url!)
//        let cover_img = UIImage(data: cover_data!)
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//          let media_playItem = MPMediaItemArtwork(image: cover_img!)
//          let media_center = MPNowPlayingInfoCenter.defaultCenter()
//          let playingInfo: [String:AnyObject] = [MPMediaItemPropertyTitle : "Sont Title",
//            MPMediaItemPropertyArtist : "Artist Name",
//            MPMediaItemPropertyArtwork : media_playItem,
//            MPNowPlayingInfoPropertyPlaybackRate : 1.0]
//          media_center.nowPlayingInfo = playingInfo
//        })
//      }
}

