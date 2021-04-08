//
//  AppPersistence.swift
//  FityIt
//
//  Created by Txai Wieser on 13/03/18.
//  Copyright © 2018 Txai Wieser. All rights reserved.
//

import SpriteKit

enum AppPersistence {
    static func newPlayedMatch() {
        matchesPlayedSinceLaunch += 1
        print("STATISTICS: \(matchesPlayedSinceLaunch) matches since launch")
        print("STATISTICS: \(matchesPlayedSinceTheBeginningOfTime) total matches")
    }
    
    static func saveNewScore(_ score: Score) {
        if score.points > highScorePoints {
            highScorePoints = score.points
            reportNewAchievement(points: score.points)
        }
        
        GCHelper.sharedInstance.reportLeaderboardIdentifier(AppDefines.Constants.mainLeaderboardID, score: score.points)
    }
    
    static func resetUserDefaults() {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    static var matchesPlayedSinceLaunch: Int = 0 {
        didSet {
            if matchesPlayedSinceLaunch != 0 {
                matchesPlayedSinceTheBeginningOfTime += 1
            }
        }
    }
    
    private static var matchesPlayedSinceTheBeginningOfTime: Int {
        set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.integer(forKey: #function)
        }
    }
    
    static var alreadyPlayTutorial: Bool {
        set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: #function)
        }
    }
    

    static var highScorePoints: Int {
        set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.integer(forKey: #function)
        }
    }
    
    private static func reportNewAchievement(points: Int) {
        GCHelper.sharedInstance.reportAchievementIdentifier("10POINTS", percent: 100 * Double(points) / 10)
        GCHelper.sharedInstance.reportAchievementIdentifier("20POINTS", percent: 100 * Double(points) / 20)
        GCHelper.sharedInstance.reportAchievementIdentifier("30POINTS", percent: 100 * Double(points) / 30)
        GCHelper.sharedInstance.reportAchievementIdentifier("40POINTS", percent: 100 * Double(points) / 40)
        GCHelper.sharedInstance.reportAchievementIdentifier("50POINTS", percent: 100 * Double(points) / 50)
        GCHelper.sharedInstance.reportAchievementIdentifier("60POINTS", percent: 100 * Double(points) / 60)
        GCHelper.sharedInstance.reportAchievementIdentifier("70POINTS", percent: 100 * Double(points) / 70)
        GCHelper.sharedInstance.reportAchievementIdentifier("80POINTS", percent: 100 * Double(points) / 80)
        GCHelper.sharedInstance.reportAchievementIdentifier("90POINTS", percent: 100 * Double(points) / 90)
        GCHelper.sharedInstance.reportAchievementIdentifier("100POINTS", percent: 100 * Double(points) / 100)
    }
}
