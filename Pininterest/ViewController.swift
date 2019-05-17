//
//  ViewController.swift
//  Pininterest
//
//  Created by Prateek Gupta on 16/05/19.
//  Copyright © 2019 Prateek Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let images = [#imageLiteral(resourceName: "8"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "10"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "9"), #imageLiteral(resourceName: "6"), #imageLiteral(resourceName: "7"), #imageLiteral(resourceName: "2")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let layout = collectionView.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

//MARK: Without Pininterest Layout file of Ray Wenderlich
/*
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing: CGFloat = 5

        return CGSize(width: (width/numberOfColumns) - (xInsets+cellSpacing), height: (width/numberOfColumns) - (xInsets+cellSpacing))
    }
}
 */

//MARK: - PINTEREST LAYOUT DELEGATE
extension ViewController : PinterestLayoutDelegate {
    
    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let image = images[indexPath.item]
        let height = image.size.height
        return height
    }
    
}


extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
}
