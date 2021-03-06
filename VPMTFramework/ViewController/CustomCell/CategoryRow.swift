//
//  CategoryRow.swift
//  VPMTFramework
//
//  Created by Vu Phan on 8/16/16.
//  Copyright © 2016 beeTeam. All rights reserved.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var indentify:String = "videoCell"
    var lsItems:NSMutableArray!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup Content View as a Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(UINib(nibName: "VideoCell", bundle: nil), forCellWithReuseIdentifier: indentify)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // num of feature per row
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(indentify, forIndexPath: indexPath) as! VideoCell
        
        let feature = lsItems.objectAtIndex(indexPath.row) as! Feature
        
        cell.imageView.image = UIImage(named: feature.imageUrl as String)
        cell.lbName.text = feature.name as String
        cell.lbCategory.text = feature.category as String
        cell.lbPrice.text = feature.price as String
        
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 3
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
