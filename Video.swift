//
//  Video.swift
//
//  Created by Lucas Gordon on 12/06/2015.
//  Copyright (c) 2015 Lucas Gordon. All rights reserved.
//

import Foundation
import MediaPlayer

class Video {
    static var player = MPMoviePlayerController()

    static func add (view: UIView, name: String, overlay: CGFloat? = 0.0) {
        if name.rangeOfString(".") != nil {
            let nameArr = split(name) {$0 == "."}
            if let path = NSBundle.mainBundle().pathForResource(nameArr[0], ofType:nameArr[1]) {
                if let url = NSURL.fileURLWithPath(path) {
                    player.contentURL = url
                    player.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
                    player.view.sizeToFit()
                    player.scalingMode = MPMovieScalingMode.AspectFill
                    player.fullscreen = true
                    player.controlStyle = MPMovieControlStyle.None
                    player.movieSourceType = MPMovieSourceType.File
                    player.repeatMode = MPMovieRepeatMode.One
                    player.play()
                    view.addSubview(player.view)
                    if let alpha = overlay {
                        var overlayView = UIView(frame: view.frame)
                        overlayView.backgroundColor = UIColor.blackColor()
                        overlayView.alpha = alpha
                        view.addSubview(overlayView)
                        view.sendSubviewToBack(overlayView)
                    }
                    view.sendSubviewToBack(player.view)
                }
            }
        }
    }
}