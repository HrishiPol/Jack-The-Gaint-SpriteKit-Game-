//
//  MyScence.swift
//  Jack The Gaint
//
//  Created by synerzip on 19/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import SpriteKit

class MyScene: SKScene, SKPhysicsContactDelegate{
    
    var player: Player?;
    var canMove = false;
    var moveLeft = false;
    
    var bg1: BGClass?;
    var bg2: BGClass?;
    var bg3: BGClass?;
    
    var cloudsController = CloudController();
    
    var mainCamera: SKCameraNode?;
    
    private var pausePanel : SKSpriteNode?;
    
    var center: CGFloat?;
    
    private let playerMinX = CGFloat(-214);
    private let playerMaxX = CGFloat(214);
    
    private var acceleration = CGFloat();
    private var cameraSpeed = CGFloat();
    private var maxSpeed = CGFloat();
    
    private var cameraDistanceBeforeCreatingNewClouds = CGFloat();
    let distanceBetweenClouds = CGFloat(240);
    let minX = CGFloat(-150);
    let maxX = CGFloat(150);
    
    override func didMove(to view: SKView) {
     
        GameManager.instance.initiliseGameData();
        intilizeVariables();
    }
    
    override func update(_ currentTime: TimeInterval) {
        managePlayer();
        moveCamera();
        manageBackGrounds();
        createNewClouds();
        player?.setScore();
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody();
        var secondBody = SKPhysicsBody();
        
        if contact.bodyA.node?.name == "Player" {
            
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
        }
        else{
            
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
        }
        
        if firstBody.node?.name == "Player" && secondBody.node?.name == "Life" {
            
            // Play the sound for life.
            // Increament the Life.
            GamePlayController.instance.incrementLife();
            // Remove the life sign.
            secondBody.node?.removeFromParent();
        }
        else if firstBody.node?.name == "Player" && secondBody.node?.name == "Coin"{
            
            // Play the sound for life.
            // Increament the score.
            GamePlayController.instance.incrementCoin();
            // Remove the life sign.
            secondBody.node?.removeFromParent();
        }
        else if firstBody.node?.name == "Player" && secondBody.node?.name == "Dark Cloud"{
         
            // Kill the player.
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        for touch in touches{
            
            let location = touch.location(in: self);
            
            if self.scene?.isPaused == false {
                if location.x > center! {
                    moveLeft = false;
                    player?.animatePlayer(moveLeft: moveLeft);
                }else{
                    moveLeft = true;
                    player?.animatePlayer(moveLeft: moveLeft);
                }
            }
            
            if atPoint(location).name == "Pause" {
                
                self.scene?.isPaused = true;
                createPausePanel();
            }
            
            if atPoint(location).name == "Resume" {
                
                pausePanel?.removeFromParent();
                self.scene?.isPaused = false;
            }
            
            if atPoint(location).name == "Quit" {
                
                let scene = MainMenu(fileNamed: "MainMenu");
                scene?.scaleMode = .aspectFill;
                self.view?.presentScene(scene!, transition: SKTransition.doorsOpenVertical(withDuration: 1.5));
            }
        }
        canMove = true;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        canMove = false;
        player?.stopPlayerAction();
    }
    
    func intilizeVariables(){

        physicsWorld.contactDelegate = self;
        center = (self.scene?.size.width)!/(self.scene?.size.height)!;
        player = self.childNode(withName: "Player") as? Player;
        player?.initilizePlayerAndAnimations();
        
        mainCamera = self.childNode(withName: "Main Camera") as? SKCameraNode!;
        
        getBackgrounds();
        getLabels();
        GamePlayController.instance.initializeVariables();
        
        cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: true);
        
        cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
        setCameraSpeed();
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
        
        if (player?.position.x)! > playerMaxX {
            player?.position.x = playerMaxX;
        }
        
        if (player?.position.x)! < playerMinX {
            player?.position.x = playerMinX;
        }

        
        if (player?.position.y)! - (player?.size.height)! * 3.7 > (self.mainCamera?.position.y)! {
         
            self.scene?.isPaused = true;
        }
        
        if (player?.position.y)! + (player?.size.height)! * 3.7 < (self.mainCamera?.position.y)! {
            self.scene?.isPaused = true;
        }
    }
    
    func manageBackGrounds(){
        
        bg1?.moveBG(camera: self.mainCamera!);
        bg2?.moveBG(camera: self.mainCamera!);
        bg3?.moveBG(camera: self.mainCamera!);
    }
    
    func moveCamera(){
        
        cameraSpeed += acceleration;
        if cameraSpeed > maxSpeed {
            cameraSpeed = maxSpeed;
        }
        
        
        self.mainCamera?.position.y -= cameraSpeed;
    }
    
    func getLabels(){
        
        GamePlayController.instance.scoreText = self.mainCamera?.childNode(withName: "lblScore") as? SKLabelNode;
        GamePlayController.instance.lifeText = self.mainCamera?.childNode(withName: "lblLife") as? SKLabelNode;
        GamePlayController.instance.coinText = self.mainCamera?.childNode(withName: "lblCoin") as? SKLabelNode;
    }
    
    func createNewClouds(){
        
        if cameraDistanceBeforeCreatingNewClouds > (mainCamera?.position.y)! {
            cameraDistanceBeforeCreatingNewClouds = (mainCamera?.position.y)! - 400;
            cloudsController.arrangeCloudsInScene(scene: self.scene!, distanceBetweenClouds: distanceBetweenClouds, center: center!, minX: minX, maxX: maxX, initialClouds: false);
            
            checkForChildsOutOfScreen();
        }
    }
    
    func checkForChildsOutOfScreen(){
        
        for child in children{
            
            if child.position.y > (mainCamera?.position.y)! + (self.scene?.scene?.size.height)! {
                
                let childName = child.name?.components(separatedBy: " ");
                
                if childName?[0] != "BG" {
                    child.removeFromParent();
                }
            }
        }
    }
    
    func createPausePanel(){
        
        pausePanel = SKSpriteNode(imageNamed: "Pause Menu");
        
        let resumeBtn = SKSpriteNode(imageNamed: "Resume Button");
        let quitBtn = SKSpriteNode(imageNamed: "Quit Button 2");
        
        
        pausePanel?.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        pausePanel?.xScale = 1.6;
        pausePanel?.yScale = 1.6;
        pausePanel?.zPosition = 5;
        pausePanel?.position = CGPoint(x: (self.mainCamera?.frame.size.width)!/2, y: (self.mainCamera?.frame.size.height)!/2);
        
        resumeBtn.name = "Resume";
        resumeBtn.zPosition = 6;
        resumeBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        resumeBtn.position = CGPoint(x: (pausePanel?.position.x)!, y: (pausePanel?.position.y)! + 25);

        quitBtn.name = "Quit";
        quitBtn.zPosition = 6;
        quitBtn.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        quitBtn.position = CGPoint(x: (pausePanel?.position.x)!, y: (pausePanel?.position.y)! - 45);
        
        pausePanel?.addChild(resumeBtn);
        pausePanel?.addChild(quitBtn);
        
        self.mainCamera?.addChild(pausePanel!);
    }
   
    private func setCameraSpeed(){
        
        if GameManager.instance.getEasyDifficulty() {
            acceleration = 0.001;
            cameraSpeed = 1.5;
            maxSpeed = 4;
        } else if GameManager.instance.getMediumDifficulty() {
            acceleration = 0.002;
            cameraSpeed = 2.5;
            maxSpeed = 6;
        } else if GameManager.instance.getHardDifficulty() {
            acceleration = 0.003;
            cameraSpeed = 2.5;
            maxSpeed = 8;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
