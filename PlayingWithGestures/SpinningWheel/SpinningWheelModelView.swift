//
//  SpinningWheelModelView.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 13/05/2021.
//

import Foundation
import UIKit

class SpinningWheelModelView {
    
    let slices = [Slice(color: SliceUtilities.unluckyColor, text: SliceUtilities.unluckyText, description: SliceUtilities.unluckyDes),
                  Slice(color: SliceUtilities.luckyColor, text: SliceUtilities.luckyText, description: SliceUtilities.luckyDes),
                  Slice(color: SliceUtilities.supriseColor, text: SliceUtilities.supriseText, description: SliceUtilities.supriseDes),
                  Slice(color: SliceUtilities.challengeColor, text: SliceUtilities.challengeText, description: SliceUtilities.challengeDes),
                  Slice(color: SliceUtilities.unluckyColor, text: SliceUtilities.unluckyText, description: SliceUtilities.unluckyDes),
                  Slice(color: SliceUtilities.luckyColor, text: SliceUtilities.luckyText, description: SliceUtilities.luckyDes),
                  Slice(color: SliceUtilities.supriseColor, text: SliceUtilities.supriseText, description: SliceUtilities.supriseDes),
                  Slice(color: SliceUtilities.challengeColor, text: SliceUtilities.challengeText, description: SliceUtilities.challengeDes),
                  Slice(color: SliceUtilities.unluckyColor, text: SliceUtilities.unluckyText, description: SliceUtilities.unluckyDes),
                  Slice(color: SliceUtilities.luckyColor, text: SliceUtilities.luckyText, description: SliceUtilities.luckyDes),
                  Slice(color: SliceUtilities.supriseColor, text: SliceUtilities.supriseText, description: SliceUtilities.supriseDes),
                  Slice(color: SliceUtilities.challengeColor, text: SliceUtilities.challengeText, description: SliceUtilities.challengeDes)]
}

struct Slice {
    var color: UIColor
    var text: String
    var description: String
}

struct SliceUtilities {
    static let unluckyColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
    static let luckyColor   = UIColor(red: 74/255, green: 183/255, blue: 72/255, alpha: 0.3)
    static let supriseColor = UIColor(red: 159/255, green: 55/255, blue: 149/255, alpha: 0.3)
    static let challengeColor = UIColor(red: 251/255, green: 229/255, blue: 7/255, alpha: 0.3)
    
    static let unluckyText = "BAD LUCK!"
    static let luckyText = "LUCK"
    static let supriseText = "SUPRISE"
    static let challengeText = "CHALLENGE"
    
    static let unluckyDes = "Today you will be unlucky, it's best stay at home!"
    static let luckyDes = "You will be lucky today! Don't waste it, play the lottery!"
    static let supriseDes = "Your future is a mystery"
    static let challengeDes = "A lot of challenges await you today, be brave"
}
