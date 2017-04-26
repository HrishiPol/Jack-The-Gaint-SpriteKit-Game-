//
//  OptionScene.swift
//  Jack The Gaint
//
//  Created by synerzip on 22/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class OptionScene: SKScene{
    
    private var easyBtn: SKSpriteNode?;
    private var mediumBtn: SKSpriteNode?;
    private var hardBtn: SKSpriteNode?;
    
    private var checkMark: SKSpriteNode?;

    
    override func didMove(to view: SKView) {
     
        initiliseVariables();
        setCheckMark();
    }
    
    func initiliseVariables(){
        self.easyBtn = self.childNode(withName: "Easy") as? SKSpriteNode;
        self.mediumBtn = self.childNode(withName: "Medium") as? SKSpriteNode;
        self.hardBtn = self.childNode(withName: "Hard") as? SKSpriteNode;
        self.checkMark = self.childNode(withName: "Check") as? SKSpriteNode;
    }
    
    func setCheckMark(){
        if GameManager.instance.getEasyDifficulty()  == true {
            self.checkMark?.position.y = (easyBtn?.position.y)!;
        } else if GameManager.instance.getMediumDifficulty() == true {
            self.checkMark?.position.y = (mediumBtn?.position.y)!;
        }else if GameManager.instance.getHardDifficulty() == true {
            self.checkMark?.position.y = (hardBtn?.position.y)!;
        }
    }
    
    private func setDifficulty(difficulty: String){
        
        switch difficulty {
            
        case "easy":
            GameManager.instance.setEasyDifficulty(easyDifficulty: true);
            GameManager.instance.setMediumDifficulty(mediumDifficulty: false);
            GameManager.instance.setHardDifficulty(hardDifficulty: false);
            break;
        case "medium":
            GameManager.instance.setEasyDifficulty(easyDifficulty: false);
            GameManager.instance.setMediumDifficulty(mediumDifficulty: true);
            GameManager.instance.setHardDifficulty(hardDifficulty: false);
            break;
        case "hard":
            GameManager.instance.setEasyDifficulty(easyDifficulty: false);
            GameManager.instance.setMediumDifficulty(mediumDifficulty: false);
            GameManager.instance.setHardDifficulty(hardDifficulty: true);
            break;
        default:
            break;
            
        }
        GameManager.instance.saveData();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            
            let location = touch.location(in: self);
            
            if atPoint(location) == easyBtn {
                checkMark?.position.y = (easyBtn?.position.y)!;
                setDifficulty(difficulty: "easy");
            }
            
            if atPoint(location) == mediumBtn {
                checkMark?.position.y = (mediumBtn?.position.y)!;
                setDifficulty(difficulty: "medium");
            }

            if atPoint(location) == hardBtn {
                checkMark?.position.y = (hardBtn?.position.y)!;
                setDifficulty(difficulty: "hard");
            }
            
            checkMark?.zPosition = 4;
            
            if atPoint(location).name == "Back" {
                
                let scene = MainMenu(fileNamed: "MainMenu");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1.5));
                
            }
        }
    }
}
