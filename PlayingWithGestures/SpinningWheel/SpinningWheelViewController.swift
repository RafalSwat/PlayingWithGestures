//
//  SpinningWheelViewController.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 13/05/2021.
//

import UIKit
import SpinWheelControl

enum SpinWheelState {
    case Spins
    case Stands
}

class SpinningWheelViewController: UIViewController {
    
    @IBOutlet weak var wheelContainer: UIView!
    @IBOutlet weak var poiterView    : UIImageView!
    @IBOutlet weak var resultLabel   : UILabel!
    
    var spinWheelControl: SpinWheelControl!
    
    private let spinningWheelModelView = SpinningWheelModelView()
    private var state: SpinWheelState  = .Stands
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupSpinWheel()
        setupSpinWheelDelegateAndDataSorce()
        changePoiterImage()
    }
    func setupSpinWheel() {
        let frame = CGRect(x: 0, y: 0, width: self.wheelContainer.frame.size.width, height: self.wheelContainer.frame.size.width)
        spinWheelControl = SpinWheelControl(frame: frame, snapOrientation: SpinWheelDirection.up, wedgeLabelOrientation: WedgeLabelOrientation.inOut)
        spinWheelControl.addTarget(self, action: #selector(spinWheelDidChangeValue), for: UIControl.Event.valueChanged)
        
        self.wheelContainer.addSubview(spinWheelControl)
        self.wheelContainer.bringSubviewToFront(poiterView)
    }
    func setupSpinWheelDelegateAndDataSorce() {
        spinWheelControl.dataSource = self
        spinWheelControl.reloadData()
        spinWheelControl.delegate   = self
    }
    @IBAction func spinWheelDidChangeValue(sender: AnyObject) {
        self.resultLabel.text = spinningWheelModelView.slices[self.spinWheelControl.selectedIndex].description
    }
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedge = SpinWheelWedge()
        
        wedge.shape.fillColor = spinningWheelModelView.slices[Int(index)].color.cgColor
        wedge.label.text = spinningWheelModelView.slices[Int(index)].text
        
        return wedge
    }
    func changePoiterImage() {
        Animations.simpleAnimate(actions: {
            if self.state == .Stands {
                self.poiterView.transform = .identity
            } else {
                self.poiterView.transform = self.poiterView.transform.rotated(by: -.pi / 2)
            }
        })
    }
}

extension SpinningWheelViewController: SpinWheelControlDelegate {
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        self.state = .Stands
        changePoiterImage()
    }
    func spinWheelDidRotateByRadians(radians: Radians) {
        if self.state == .Stands {
            self.state = .Spins
            changePoiterImage()
        }
    }
}

extension SpinningWheelViewController: SpinWheelControlDataSource {
    
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return UInt(spinningWheelModelView.slices.count)
    }
}
