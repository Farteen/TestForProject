//
//  FTAudioStreamItem.swift
//  IceCreamShop
//
//  Created by user on 12/2/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import UIKit
import DOUAudioStreamer

class FTAudioStreamItem: NSObject,DOUAudioFile {
  ///文件url
  let file_url: NSURL
  ///是否为本地文件
  var isLocalFile: Bool = false
  
  init(fileURL: NSURL!) {
    self.file_url = fileURL
  }
  
  func audioFileURL() -> NSURL! {
    return self.isLocalFile ? self.file_url : NSURL(string: "http://m8.music.126.net/20151202150454/5e466b4f8e6f45652a4fa339801dfb43/ymusic/f37e/ba72/77c2/16b6400fa7832b5acd04b6567250fa22.mp3")!
  }
  
}
