//
//  File.swift
//  Jack The Gaint
//
//  Created by synerzip on 25/04/17.
//  Copyright © 2017 synerzip. All rights reserved.
//

import Foundation

class GameData: NSObject, NSCoding {
    
    
    struct Keys {
        
        static let EasyDifficultyScore  = "EasyDifficultyScore";
        static let MediumDifficultyScore  = "MediumDifficultyScore";
        static let HardDifficultyScore  = "HardDifficultyScore";
        
        static let EasyDifficultyCoinScore  = "EasyDifficultyCoinScore";
        static let MediumDifficultyCoinScore  = "MediumDifficultyCoinScore";
        static let HardDifficultyCoinScore  = "HardDifficultyCoinScore";
        
        static let EasyDifficulty  = "EasyDifficulty";
        static let MediumDifficulty  = "MediumDifficulty";
        static let HardDifficulty  = "HardDifficulty";

        static let Music = "Music";
    }
    
    private var easyDifficultyScore = Int32();
    private var mediumDifficultyScore = Int32();
    private var hardDifficultyScore = Int32();
    
    private var easyDifficultyCoinScore = Int32();
    private var mediumDifficultyCoinScore = Int32();
    private var hardDifficultyCoinScore = Int32();
    
    private var easyDifficulty = false;
    private var mediumDifficulty = false;
    private var hardDifficulty = false;
    
    private var isMusicOn = false;
    
    
    override init(){}
    
    required init?(coder aDecoder: NSCoder) {
        super.init();
        
        self.easyDifficultyScore = aDecoder.decodeCInt(forKey: Keys.EasyDifficultyScore);
        self.mediumDifficultyScore = aDecoder.decodeCInt(forKey: Keys.MediumDifficultyScore);
        self.hardDifficultyScore = aDecoder.decodeCInt(forKey: Keys.HardDifficultyScore);
        
        self.easyDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.EasyDifficultyCoinScore);
        self.mediumDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.MediumDifficultyCoinScore);
        self.hardDifficultyCoinScore = aDecoder.decodeCInt(forKey: Keys.HardDifficultyCoinScore);
        
        self.easyDifficulty = aDecoder.decodeBool(forKey: Keys.EasyDifficulty);
        self.mediumDifficulty = aDecoder.decodeBool(forKey: Keys.MediumDifficulty);
        self.hardDifficulty = aDecoder.decodeBool(forKey: Keys.HardDifficulty);
        
        self.isMusicOn = aDecoder.decodeBool(forKey: Keys.Music);
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.easyDifficultyScore, forKey: Keys.EasyDifficultyScore);
        aCoder.encode(self.mediumDifficultyScore, forKey: Keys.MediumDifficultyScore);
        aCoder.encode(self.hardDifficultyScore, forKey: Keys.HardDifficultyScore);
        
        aCoder.encode(self.easyDifficultyCoinScore, forKey: Keys.EasyDifficultyCoinScore);
        aCoder.encode(self.mediumDifficultyCoinScore, forKey: Keys.MediumDifficultyCoinScore);
        aCoder.encode(self.hardDifficultyCoinScore, forKey: Keys.HardDifficultyCoinScore);
        
        aCoder.encode(self.easyDifficulty, forKey: Keys.EasyDifficulty);
        aCoder.encode(self.mediumDifficulty, forKey: Keys.MediumDifficulty);
        aCoder.encode(self.hardDifficulty, forKey: Keys.HardDifficulty);

        aCoder.encode(self.isMusicOn, forKey: Keys.Music);
    }
    
    // Getter.
    func getEasyDifficultyScore() -> Int32{
        
        return self.easyDifficultyScore;
    }
    
    func getMediumDifficultyScore() -> Int32{
        
        return self.mediumDifficultyScore;
    }

    func getHardDifficultyScore() -> Int32{
        
        return self.hardDifficultyScore;
    }
    
    func getEasyDifficultyCoinScore() -> Int32{
        
        return self.easyDifficultyCoinScore;
    }
    
    func getMediumDifficultyCoinScore() -> Int32{
        
        return self.mediumDifficultyCoinScore;
    }
    
    func getHardDifficultyCoinScore() -> Int32{
        
        return self.hardDifficultyCoinScore;
    }
    
    func getEasyDifficulty() -> Bool{
        
        return self.easyDifficulty;
    }
    
    func getMediumDifficulty() -> Bool{
        
        return self.mediumDifficulty;
    }
    
    func getHardDifficulty() -> Bool{
        
        return self.hardDifficulty;
    }
    
    //Setter

    func setEasyDifficultyScore(easyDifficultyScore: Int32){
        
         self.easyDifficultyScore = Int32(easyDifficultyScore);
    }
    
    func setMediumDifficultyScore(mediumDifficultyScore: Int32){
        
        self.mediumDifficultyScore = Int32(mediumDifficultyScore);
    }
    
    func setHardDifficultyScore(hardDifficultyScore: Int32){
        
        self.hardDifficultyScore = Int32(hardDifficultyScore);
    }
    
    func setEasyDifficultyCoinScore(easyDifficultyCoinScore: Int32){
        
        self.easyDifficultyCoinScore = Int32(easyDifficultyCoinScore);
    }
    
    func setMediumDifficultyCoinScore(mediumDifficultyCoinScore: Int32){
        
        self.mediumDifficultyCoinScore = Int32(mediumDifficultyCoinScore);
    }
    
    func setHardDifficultyCoinScore(hardDifficultyCoinScore: Int32){
        
        self.hardDifficultyCoinScore = Int32(hardDifficultyCoinScore);
    }

    func setEasyDifficulty(easyDifficulty: Bool){
        
        self.easyDifficulty = easyDifficulty;
    }

    func setMediumDifficulty(mediumDifficulty: Bool){
        
        self.mediumDifficulty = mediumDifficulty;
    }

    func setHardDifficulty(hardDifficulty: Bool){
        
        self.hardDifficulty = hardDifficulty;
    }
    
    func getIsMusicOn()-> Bool{
    
        return self.isMusicOn;
    }
    
    func setIsMusicOn(isMusicOn: Bool){
        
        self.isMusicOn = isMusicOn;
    }



}
