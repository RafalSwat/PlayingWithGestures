//
//  HomeViewCell.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 11/05/2021.
//

import UIKit

class HomeViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(icon: Icon) {
        self.imageView.image = icon.image
        self.titleLabel.text = icon.title
        
        setupAppearance()
    }
    
    func setupAppearance() {
        self.contentView.backgroundColor     = .systemOrange
        self.contentView.layer.cornerRadius  = 15.0
        self.contentView.layer.borderWidth   = 1.0
        self.contentView.layer.borderColor   = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius  = 5.0
        self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
        self.layer.shadowPath    = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }

}
