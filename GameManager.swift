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
    private var gameData: GameData?;
    
    
    func initiliseGameData(){

        if !FileManager.default.fileExists(atPath: getFilePath()){
            // Set up game intial values.
            self.gameData = GameData();
            self.gameData!.setEasyDifficultyScore(easyDifficultyScore: 0);
            self.gameData!.setMediumDifficultyScore(mediumDifficultyScore: 0);
            self.gameData!.setHardDifficultyScore(hardDifficultyScore: 0);

            self.gameData!.setEasyDifficultyCoinScore(easyDifficultyCoinScore: 0);
            self.gameData!.setMediumDifficultyCoinScore(mediumDifficultyCoinScore: 0);
            self.gameData!.setHardDifficultyCoinScore(hardDifficultyCoinScore: 0);
            
            self.gameData!.setEasyDifficulty(easyDifficulty: false);
            self.gameData!.setMediumDifficulty(mediumDifficulty: true);
            self.gameData!.setHardDifficulty(hardDifficulty: false);

            self.gameData!.setIsMusicOn(isMusicOn: false);
            saveData();
        }
        loadData();
    }
    
    func loadData(){
        
        self.gameData = NSKeyedUnarchiver.unarchiveObject(withFile: (getFilePath())) as? GameData!;
    }
    
    func saveData(){
        if gameData != nil {
            NSKeyedArchiver.archiveRootObject(gameData!, toFile: getFilePath());
        }
    }

    private func getFilePath()-> String{
        
        let manager = FileManager.default;
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first;
        return url!.appendingPathComponent("Game Data").path;
    }
    
    // Getter.
    func getEasyDifficultyScore()-> Int32{
        return self.gameData!.getEasyDifficultyScore();
    }
    
    func getMediumDifficultyScore()-> Int32{
        return self.gameData!.getMediumDifficultyScore();
    }

    func getHardDifficultyScore()-> Int32{
        return self.gameData!.getHardDifficultyScore();
    }
    
    func getEasyDifficultyCoinScore()-> Int32{
        return self.gameData!.getEasyDifficultyCoinScore();
    }
    
    func getMediumDifficultyCoinScore()-> Int32{
        return self.gameData!.getMediumDifficultyCoinScore();
    }
    
    func getHardDifficultyCoinScore()-> Int32{
        return self.gameData!.getHardDifficultyCoinScore();
    }

    func getEasyDifficulty()->Bool{
        return self.gameData!.getEasyDifficulty();
    }
    func getMediumDifficulty()->Bool{
        return self.gameData!.getMediumDifficulty();
    }

    func getHardDifficulty()->Bool{
        return self.gameData!.getHardDifficulty();
    }
    
    func getIsMusicOn()->Bool{
        return self.gameData!.getIsMusicOn();
    }
    
    // Setter.
    func setEasyDifficultyScore(easyDifficultyScore: Int32){
        self.gameData!.setEasyDifficultyScore(easyDifficultyScore: easyDifficultyScore);
    }
    
    func setMediumDifficultyScore(mediumDifficultyScore: Int32){
        self.gameData!.setMediumDifficultyScore(mediumDifficultyScore: mediumDifficultyScore);
    }

    func setHardDifficultyScore(hardDifficultyScore: Int32){
        self.gameData!.setHardDifficultyScore(hardDifficultyScore: hardDifficultyScore);
    }
    
    func setEasyDifficultyCoinScore(easyDifficultyCoinScore: Int32){
        self.gameData!.setEasyDifficultyCoinScore(easyDifficultyCoinScore: easyDifficultyCoinScore);
    }

    func setMediumDifficultyCoinScore(mediumDifficultyCoinScore: Int32){
        self.gameData!.setMediumDifficultyCoinScore(mediumDifficultyCoinScore: mediumDifficultyCoinScore);
    }

    func setHardDifficultyCoinScore(hardDifficultyCoinScore: Int32){
        self.gameData!.setHardDifficultyCoinScore(hardDifficultyCoinScore: hardDifficultyCoinScore);
    }

    
    func setEasyDifficulty(easyDifficulty: Bool) {
        self.gameData!.setEasyDifficulty(easyDifficulty: easyDifficulty);
    }

    func setMediumDifficulty(mediumDifficulty: Bool) {
        self.gameData!.setMediumDifficulty(mediumDifficulty: mediumDifficulty);
    }

    func setHardDifficulty(hardDifficulty: Bool) {
        self.gameData!.setHardDifficulty(hardDifficulty: hardDifficulty);
    }

    func setIsMusicOn(isMusicOn: Bool) {
        self.gameData!.setIsMusicOn(isMusicOn: isMusicOn);
    }
}
