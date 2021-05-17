//
//  SpaceTravelViewController.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 14/05/2021.
//

import UIKit

class SpaceTravelViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var spaceView : UIImageView!
    
    
    private let imageViewScale: CGFloat = 1.0
    private let maxScale: CGFloat       = 7.0
    private let minScale: CGFloat       = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTapGesture(view: spaceView)
        adjustScrollView()
        setupScrollViewDelegates()
    }
    
    func addTapGesture(view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        view.addGestureRecognizer(tap)
    }
    @IBAction func handleTap(sender: UITapGestureRecognizer) {
        Animations.simpleAnimate {
            self.scrollView.zoomScale = 1
        }
    }
    
    func centerScrollViewContent() {
        let boundSize = scrollView.bounds.size
        var contentFrame = spaceView.frame
        
        if contentFrame.width < boundSize.width {
            contentFrame.origin.x = (boundSize.width - contentFrame.size.width) / 2
        } else {
            contentFrame.origin.x = 0
        }
        
        if contentFrame.height < boundSize.height {
            contentFrame.origin.y = (boundSize.height - contentFrame.size.height) / 2
        } else {
            contentFrame.origin.y = 0
        }
        
        spaceView.frame = contentFrame
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContent()
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return spaceView
    }
    func adjustScrollView() {
        if let image = spaceView.image {
            scrollView.contentSize      = image.size
            scrollView.minimumZoomScale = minScale
            scrollView.maximumZoomScale = maxScale
            scrollView.zoomScale        = minScale
        }
    }
}

extension SpaceTravelViewController: UIScrollViewDelegate {
    func setupScrollViewDelegates() {
        self.scrollView.delegate = self
    }
}


