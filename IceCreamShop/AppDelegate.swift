//
//  AppDelegate.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: Instance Variables
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    let share_audio_session = AVAudioSession.sharedInstance()
    do {
      try share_audio_session.setCategory(AVAudioSessionCategoryPlayback)
      try share_audio_session.setActive(true)
    } catch {
      
    }
    return true
  }
}
