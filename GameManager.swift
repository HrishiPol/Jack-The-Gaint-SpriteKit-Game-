//
//  GameController.swift
//  Jack The Gaint
//
//  Created by synerzip on 25/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import Foundation

class GameManager {
    
    static let instance = GameManager();
    
    private init(){}
    
    var gameStartedFromMainMenu = false;
    var gameRestartedPlayerDied = false;
}
