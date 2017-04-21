//
//  MyScence.swift
//  Jack The Gaint
//
//  Created by synerzip on 19/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class MyScene: SKScene{
    
    var player: Player?;
    var canMove = false;
    var moveLeft = false;
    
    var bg1: BGClass?;
    var bg2: BGClass?;
    var bg3: BGClass?;
    
    var cloudsController = CloudController();
    
    var mainCamera: SKCameraNode?;
    
    var center: CGFloat?;
    private var cameraDistanceBeforeCreatingNewClouds = CGFloat();
    let distanceBetweenClouds = CGFloat(240);
    let minX = CGFloat(-150);
    let maxX = CGFloat(150);
    
    override func didMove(to view: SKView) {
     
        intilizeVariables();
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer();
        moveCamera();
        manageBackGrounds();
        createNewClouds();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        for touch in touches{
            
            let location = touch.location(in: self);
            
            if location.x > center! {
                moveLeft = false;
                player?.animatePlayer(moveLeft: moveLeft);
            }else{
                moveLeft = true;
                player?.animatePlayer(moveLeft: moveLeft);
            }
        }
        canMove = true;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        canMove = false;
        player?.stopPlayerAction();
    }
    
    func intilizeVariables(){
        center = (self.scene?.size.width)!/(self.scene?.size.height)!;
        player = self.childNode(withName: "Player") as? Player;
        player?.initilizePlayerAndAnimations();
        
        mainCamera = self.childNode(withName: "Main Camera") as? SKCameraNode!;
        
        getBackgrounds();
        
        cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: true);
        
        cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
    }
    
    func getBackgrounds(){
        
        bg1 = self.childNode(withName: "BG 1") as! BGClass!;
        bg2 = self.childNode(withName: "BG 2") as! BGClass!;
        bg3 = self.childNode(withName: "BG 3") as! BGClass!;

    }
    
    func managePlayer(){
        
        if canMove {
            player?.movePlayer(moveLeft: moveLeft);
        }
    }
    
    func manageBackGrounds(){
        
        bg1?.moveBG(camera: self.mainCamera!);
        bg2?.moveBG(camera: self.mainCamera!);
        bg3?.moveBG(camera: self.mainCamera!);
    }
    
    func moveCamera(){
        
        self.mainCamera?.position.y -= 3;
    }
    
    func createNewClouds(){
        
        if cameraDistanceBeforeCreatingNewClouds > (mainCamera?.position.y)! {
            cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
            cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: false);
        }
    }
}
