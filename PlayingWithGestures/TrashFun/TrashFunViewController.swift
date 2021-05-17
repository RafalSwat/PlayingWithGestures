//
//  TrashFunViewController.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 12/05/2021.
//

import UIKit

class TrashFunViewController: UIViewController {
    
    @IBOutlet weak var docView   : UIView!
    @IBOutlet weak var txtView   : UIView!
    @IBOutlet weak var folderView: UIView!
    @IBOutlet weak var trashView : UIView!
    @IBOutlet weak var trashImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addGesturesToTheViews()
    }
    
    func addGesturesToTheViews() {
        addPanGesture(view: docView)
        addPanGesture(view: txtView)
        addPanGesture(view: folderView)
    }
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        if let panView = sender.view {
            let translation = sender.translation(in: self.view)
            
            switch sender.state {
            case .began, .changed:
                panView.center = CGPoint(x: panView.center.x + translation.x,
                                         y: panView.center.y + translation.y)
                if panView.frame.intersects(trashView.frame) {
                    Animations.vibrate(view: self.trashView)
                }
                
                sender.setTranslation(.zero, in: self.view)

                break
            case .ended:
                if panView.frame.intersects(trashView.frame) {
                    Animations.simpleAnimate(actions: {
                        Animations.vibrate(view: self.trashView)
                        Animations.simpleAnimate(actions: {
                            self.trashImage.image = UIImage(named: "garbageIconFull")
                        })
                        panView.alpha = 0.0
                    })
                }
            default:
                break
            }
        }
    }
}

