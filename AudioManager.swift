//
//  AudioManager.swift
//  Jack The Gaint
//
//  Created by synerzip on 26/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import AVFoundation

class AudioManager{
    
    static let instance = AudioManager();
    private init (){}
    
    private var audioPlayer = AVAudioPlayer();
    
    func playBGMusic(){
        
        let url = Bundle.main.url(forResource: "Background music", withExtension: "mp3");
        var err: NSError?;
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url!);
            
            audioPlayer.numberOfLoops = -1;
            audioPlayer.prepareToPlay();
            audioPlayer.play();
            
        } catch let err1  as NSError{
            
            err = err1;
        }
        
        if err != nil {
            print("Player Error: \(String(describing: err))");
        }
    }
    
    func stopBGMusic(){
        
        if audioPlayer.isPlaying {
            audioPlayer.stop();
        }
    }
    
    func isAudioPlayerInitilized()->Bool{
        
        return audioPlayer == nil;
    }
}
