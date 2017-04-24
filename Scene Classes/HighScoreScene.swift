//
//  HighScoreScene.swift
//  Jack The Gaint
//
//  Created by synerzip on 22/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class HighScoreScene: SKScene{

    
    override func didMove(to view: SKView) {
        
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

