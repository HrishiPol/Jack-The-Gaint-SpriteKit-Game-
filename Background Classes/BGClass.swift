//
//  BGClass.swift
//  Jack The Gaint
//
//  Created by synerzip on 20/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode{
    
    
    
    func moveBG(camera: SKCameraNode){
        
        if self.position.y - self.size.height - 10 > camera.position.y{
            
            self.position.y -= self.size.height * 3;
        }
    }
}
