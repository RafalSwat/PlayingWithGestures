//
//  HomeViewController.swift
//  PlayingWithGestures
//
//  Created by Rafał Swat on 11/05/2021.
//

import UIKit

enum ArrangementState {
    case List
    case Grid
}

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var arrangementItem: UIBarButtonItem!
    
    private let homeViewWidth         = UIScreen.main.bounds.width
    private var spacing :CGFloat      = 16.0
    private let homeModelView         = HomeModelView()
    private var arrangementState      = ArrangementState.List
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSpacing()
        setupDelegatsAndDataSourceForCollectionView()
        setupFlowLayoutForCollectionView()
    }
    @IBAction func arrangementItemTapped(_ sender: Any) {
        if arrangementState == .List {
            self.arrangementItem.image = UIImage(systemName: "rectangle.grid.1x2")
            self.arrangementState = .Grid
            Animations.simpleAnimate(actions: {
                self.setupFlowLayoutForCollectionView()
                self.changeCellsAppearance()
            })
        } else {
            self.arrangementItem.image = UIImage(systemName: "rectangle.grid.2x2")
            self.arrangementState = .List
            Animations.simpleAnimate(actions: {
                self.setupFlowLayoutForCollectionView()
                self.changeCellsAppearance()
            })
        }
    }
    func rearrangeCollectionItems() -> CGSize {
        var numberOfItemsPerRow:CGFloat = 1
        
        if arrangementState == .List {
            numberOfItemsPerRow = 1
        } else {
            numberOfItemsPerRow = 2
        }
        let boundsCell = setupBoundsForCell(numberOfItemsPerRow: numberOfItemsPerRow)
        return boundsCell
    }
    func setupBoundsForCell(numberOfItemsPerRow: CGFloat) -> CGSize {
        let spacingBetweenCells:CGFloat = spacing
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func changeCellsAppearance() {
        for index in self.homeModelView.icons.indices {
            let indexPath = IndexPath(row: index, section:0)
            if let cell = self.collectionView.cellForItem(at: indexPath) as? HomeViewCell {
                cell.setupAppearance()
            }
        }
    }
    func setupSpacing() {
        self.spacing = homeModelView.predictSpacing()
    }
    func setupDelegatsAndDataSourceForCollectionView() {
        self.collectionView.delegate   = self
        self.collectionView.dataSource = self
    }
    func setupFlowLayoutForCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset            = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing      = spacing
        layout.minimumInteritemSpacing = spacing
        
        self.collectionView?.collectionViewLayout = layout
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let item = collectionView.cellForItem(at: indexPath) {
            let cellContent = item.contentView
            Animations.bounceAnimation(view: cellContent, scale: 1.1, duration: 0.3) {
                let segueId = self.homeModelView.icons[indexPath.row].segueIdentifier
                self.performSegue(withIdentifier: segueId, sender: self)
            }
        }
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeModelView.icons.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeViewCell
        cell.setupCell(icon: homeModelView.icons[indexPath.row])
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return rearrangeCollectionItems()
    }
}


