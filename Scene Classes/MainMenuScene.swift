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

    override func didMove(to view: SKView) {
        
        GameManager.instance.initiliseGameData();
        startBtn = self.childNode(withName: "Start") as? SKSpriteNode!;
        highScoreBtn = self.childNode(withName: "HighScore") as? SKSpriteNode!;
        optionBtn = self.childNode(withName: "Option") as? SKSpriteNode!;
        quitBtn = self.childNode(withName: "Quit") as? SKSpriteNode!;
        musicBtn = self.childNode(withName: "Music") as? SKSpriteNode!;
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self);

            if atPoint(location) == startBtn {
                // Start Game.
                GameManager.instance.gameStartedFromMainMenu = true;
                let scene = MyScene(fileNamed: "MyScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));

            }
            else if atPoint(location) == highScoreBtn{
                // High Score.
                
                let scene = HighScoreScene(fileNamed: "HighScoreScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));
                
            }
            else if atPoint(location) == optionBtn{
                // Options.
                
                let scene = OptionScene(fileNamed: "OptionScene");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsCloseVertical(withDuration: 1.5));
            }
            else if atPoint(location) == quitBtn{
                // Quit.
                
            }
            else if atPoint(location) == musicBtn{
                // Music.
                
            }
        }
        
    }
    
}
