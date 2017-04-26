//
//  GamePlayController.swift
//  Jack The Gaint
//
//  Created by synerzip on 24/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import Foundation
import SpriteKit

class GamePlayController {
    
    static let instance = GamePlayController();
    private init() {}
    
    var scoreText: SKLabelNode?;
    var coinText: SKLabelNode?;
    var lifeText: SKLabelNode?;

    
    var score: Int?;
    var coin: Int?;
    var life: Int?;
    
    
    func initializeVariables(){
        
        if GameManager.instance.gameStartedFromMainMenu {
            
            GameManager.instance.gameStartedFromMainMenu = false;
            score = 0;
            coin = 0;
            life = 2;
            
            scoreText?.text = "\(String(describing: score!))";
            coinText?.text = "x\(String(describing: coin!))";
            lifeText?.text = "x\(String(describing: life!))";
        }
        else if GameManager.instance.gameRestartedPlayerDied{
            
            GameManager.instance.gameRestartedPlayerDied = false;
            
            scoreText?.text = "\(String(describing: score!))";
            coinText?.text = "x\(String(describing: coin!))";
            lifeText?.text = "x\(String(describing: life!))";
        }
    }
    
    func incrementScore(){
        
        score! += 1;
        scoreText?.text = "\(String(describing: score!))";
    }
    
    func incrementCoin(){
        
        coin! += 1;
        score! += 200;
        coinText?.text = "x\(String(describing: coin!))";
        scoreText?.text = "\(String(describing: score!))";
    }
    
    func incrementLife(){
        
        life! += 1;
        score! += 300;
        scoreText?.text = "\(String(describing: score!))";
        lifeText?.text = "x\(String(describing: life!))";
    }
}
