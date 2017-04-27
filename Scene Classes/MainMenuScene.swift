//
//  MainMenuScene.swift
//  Jack The Gaint
//
//  Created by synerzip on 21/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene{
    
    var startBtn: SKSpriteNode?;
    var highScoreBtn: SKSpriteNode?;
    var optionBtn: SKSpriteNode?;
    var quitBtn: SKSpriteNode?;
    var musicBtn: SKSpriteNode?;
    
//    private var musicBtn: SKSpriteNode?;
    private let musicOn = SKTexture(imageNamed: "Music On Button");
    private let musicOff = SKTexture(imageNamed: "Music Off Button");
    

    override func didMove(to view: SKView) {
        
        GameManager.instance.initiliseGameData();
        startBtn = self.childNode(withName: "Start") as? SKSpriteNode!;
        highScoreBtn = self.childNode(withName: "HighScore") as? SKSpriteNode!;
        optionBtn = self.childNode(withName: "Option") as? SKSpriteNode!;
        quitBtn = self.childNode(withName: "Quit") as? SKSpriteNode!;
        musicBtn = self.childNode(withName: "Music") as? SKSpriteNode!;
        
//        AudioManager.instance.playBGMusic();
        setMusic();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self);

            if atPoint(location) == startBtn {
                // Start Game.
                self.run(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));
                GameManager.instance.gameStartedFromMainMenu = true;
                let scene = MyScene(fileNamed: "MyScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));

            }
            else if atPoint(location) == highScoreBtn{
                // High Score.
                
                self.run(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));
                let scene = HighScoreScene(fileNamed: "HighScoreScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));
                
            }
            else if atPoint(location) == optionBtn{
                // Options.
                self.run(SKAction.playSoundFileNamed("Click Sound.wav", waitForCompletion: false));
                let scene = OptionScene(fileNamed: "OptionScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));
            }
            else if atPoint(location) == quitBtn{
                // Quit.
                
            }
            else if atPoint(location) == musicBtn{
                // Music.
                handleMusicButton();
            }
        }
        
    }
    
    private func setMusic(){
        if GameManager.instance.getIsMusicOn() {
            
            if AudioManager.instance.isAudioPlayerInitilized() {
                AudioManager.instance.playBGMusic();
                musicBtn?.texture = musicOff;
            }
        }
    }
    
    private func handleMusicButton(){
        if GameManager.instance.getIsMusicOn() {
            AudioManager.instance.stopBGMusic();
            GameManager.instance.setIsMusicOn(isMusicOn: false);
            musicBtn?.texture = musicOn;
        }
        else{
            AudioManager.instance.playBGMusic();
            GameManager.instance.setIsMusicOn(isMusicOn: true);
            musicBtn?.texture = musicOff;
        }
        GameManager.instance.saveData();
    }
    
}
