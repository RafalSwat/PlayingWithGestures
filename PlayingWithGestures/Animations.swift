//
//  Animations.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 12/05/2021.
//

import Foundation
import UIKit

class Animations {
    
    static func bounceAnimation(view: UIView, scale: CGFloat, duration: TimeInterval, completion: @escaping ()->Void) {
        UIView.animate(withDuration: duration/2, animations: {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }) { (finishedZoomIn) in
            UIView.animate(withDuration: duration/2) {
                view.transform = .identity
            } completion: { finishedZoomOut in
                if finishedZoomOut {
                    completion()
                }
            }
        }
    }
    static func vibrate(view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 2.0, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 2.0, y: view.center.y))
        view.layer.add(animation, forKey: "position")
    }
    
    static func simpleAnimate(actions: @escaping ()->Void) {
        UIView.animate(withDuration: 0.5) {
            actions()
        }

    }
}
