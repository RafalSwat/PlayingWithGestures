//
//  HomeModelView.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 12/05/2021.
//

import Foundation
import UIKit

class HomeModelView {
    let icons: [Icon] = [Icon(image: UIImage(named: "trashImage")!, title: "Trash Fun", segueIdentifier: "goToTrashFun", description: nil),
                         Icon(image: UIImage(named: "wheelImage")!, title: "Spin The Wheel", segueIdentifier: "GoToSpinningWheel", description: nil),
                         Icon(image: UIImage(named: "skyWatcherImage")!, title: "Space Travel", segueIdentifier: "GoToSpaceTravel", description: nil)]
    
    func predictSpacing() -> CGFloat {
        if icons.count < 3 {
            return 32
        } else if icons.count < 16 {
            return 16
        } else {
            return 8
        }
    }
}
