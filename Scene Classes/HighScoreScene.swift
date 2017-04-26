//
//  HighScoreScene.swift
//  Jack The Gaint
//
//  Created by synerzip on 22/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class HighScoreScene: SKScene{

    private var lblScore: SKLabelNode?;
    private var lblCoin: SKLabelNode?;
    
    override func didMove(to view: SKView) {
        
        initilizeVariables();
        setScore();
    }
    
    private func initilizeVariables(){
        
        lblScore = self.childNode(withName: "lblScore") as? SKLabelNode!;
        lblCoin = self.childNode(withName: "lblCoin") as? SKLabelNode!;
    }
    
    private func setScore(){
    
        if GameManager.instance.getEasyDifficulty() == true {
            lblScore?.text  = String((GameManager.instance.getEasyDifficultyScore()));
            lblCoin?.text = String(GameManager.instance.getEasyDifficultyCoinScore());
        } else if GameManager.instance.getMediumDifficulty() == true {
            lblScore?.text  = String((GameManager.instance.getMediumDifficultyScore()));
            lblCoin?.text = String(GameManager.instance.getMediumDifficultyCoinScore());
        } else if GameManager.instance.getHardDifficulty() == true {
            lblScore?.text  = String((GameManager.instance.getHardDifficultyScore()));
            lblCoin?.text = String(GameManager.instance.getHardDifficultyCoinScore());
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let location = touch.location(in: self);
            
            if atPoint(location).name == "Back" {
             
                let scene = MainMenu(fileNamed: "MainMenu");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1.5));
            }
        }
    }
    
}

