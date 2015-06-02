//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by ROHIT GUPTA on 5/30/15.
//  Copyright (c) 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//            if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
//                var filePathUrl = NSURL.fileURLWithPath(filePath)
//                audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
//                audioPlayer.enableRate = true
//            } else {
//                println("The filepath is empty")
//            }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
    }
    

    

    @IBAction func PlaySlowAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    
    
    @IBAction func PlayFastAudio(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}