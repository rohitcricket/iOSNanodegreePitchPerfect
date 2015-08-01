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
    
    var audioPlayer2: AVAudioPlayer! //for echo effects. Second player plays after a delay.
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    var reverbPlayers:[AVAudioPlayer] = []
    
    let N:Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
        audioPlayer2 = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        
        for i in 0...N {
            var temp = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil) 
            reverbPlayers.append(temp)
        }
        
    }
    
    
    func stopAudioEngineAndPlayer(){ //abstracted away repeated code inside a function
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
    }
    
    func setAudioPlayRate(rate: Float){ // abstracted away repeated code inside a function
        stopAudioEngineAndPlayer()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    

    @IBAction func PlaySlowAudio(sender: UIButton) {
        
        setAudioPlayRate(0.5) // set audio rate to 0.5 for slow speed.
    }
    
    
    @IBAction func PlayFastAudio(sender: UIButton) {
        
        setAudioPlayRate(1.5)
        
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {

        stopAudioEngineAndPlayer()
        playAudioWithVariablePitch(1000)

    }
    
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {

        stopAudioEngineAndPlayer()
        playAudioWithVariablePitch(-1000)

    }
    
    
    func playAudioWithVariablePitch(pitch: Float){

        stopAudioEngineAndPlayer()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    // Echo code from http://sandmemory.blogspot.com/2014/12/how-would-you-add-reverbecho-to-audio.html
    
    @IBAction func playEcho(sender: AnyObject) {
        
        stopAudioEngineAndPlayer()
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0;
        audioPlayer.play()
        
        let delay:NSTimeInterval = 0.1//100ms
        var playtime:NSTimeInterval
        playtime = audioPlayer2.deviceCurrentTime + delay
        audioPlayer2.stop()
        audioPlayer2.currentTime = 0
        audioPlayer2.volume = 0.8;
        audioPlayer2.playAtTime(playtime)
        
        // AVAudioPlayer instance has the playAtTime method, which allows us to schedule sound for future play, which can by used to make echoes and reverbations.
        
    }
    
    
    // Reverbation code from http://sandmemory.blogspot.com/2014/12/how-would-you-add-reverbecho-to-audio.html
    
    
    @IBAction func playReverb(sender: AnyObject) {
        
        stopAudioEngineAndPlayer()
        
        let delay:NSTimeInterval = 0.02 //20ms produces detectable delays
        for i in 0...N {
            var curDelay:NSTimeInterval = delay*NSTimeInterval(i)
            var player:AVAudioPlayer = reverbPlayers[i]
            //M_E is e=2.718...
            //dividing N by 2 made it sound ok for the case N=10
            var exponent:Double = -Double(i)/Double(N/2)
            var volume = Float(pow(Double(M_E), exponent))
            player.volume = volume
            player.playAtTime(player.deviceCurrentTime + curDelay)
        }
    }
    
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
