//
//  FeatureTabView.swift
//  VPMTFramework
//
//  Created by Vu Phan on 8/16/16.
//  Copyright © 2016 beeTeam. All rights reserved.
//

import UIKit
import Foundation

class FeatureTabView: BaseVC, IBaseView, UITableViewDelegate, UITableViewDataSource  {
    
    var categories = ["", "Best Flash Cards"]
    var lsFeature:NSMutableArray!
    var presenter:FeaturePresenter!
    
    let NUM_ITEM:Int = 5
    let HEADER_SECTION:Int = 0
    
    @IBOutlet weak var tbvListFeature: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = TEXT_FEATURE
        tbvListFeature.delegate = self
        tbvListFeature.dataSource = self
        // Get list all feature
        presenter = FeaturePresenter(delegate: self)
        presenter.getListFeature()
    }
    
    //TODO: Get data from model
    func doOnSuccess(result: AnyObject?){
        lsFeature = result as! NSMutableArray
    }
    
    func doOnError(err: NSError?){
        print("Error when get features!!!")
    }
    
    //TODO: Cofiguration Sesson
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    //TODO: Cofiguration Cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1 // first section only one row
        } else {
            return lsFeature.count / NUM_ITEM
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellInSection(indexPath.row, section: indexPath.section, tableView: tableView)
    }
    
    //TODO: Get cell which using in Table section
    func cellInSection(row:NSInteger, section:NSInteger, tableView: UITableView) -> UITableViewCell {
        
        let identifier:String
        var cell:UITableViewCell!
        
        if (section == HEADER_SECTION) {
            
            identifier = "headerCell"
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HeaderCell
            
            if cell == nil {
                tableView.registerNib(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? HeaderCell
            }
        } else {
            
            identifier = "cell"
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CategoryRow
            
            if cell == nil {
                tableView.registerNib(UINib(nibName: "CategoryRow", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CategoryRow
            }
            
            (cell as! CategoryRow).lsItems = getListItemInRow(row)
        }
        
        return cell
    }
    
     //TODO: Get list item in category row
    func getListItemInRow(row:Int) -> NSMutableArray {
        
        let lsItems = NSMutableArray()
        
        for index in (row * NUM_ITEM)...((row * NUM_ITEM) + NUM_ITEM - 1) {
            if index <= (lsFeature.count - 1) {
                lsItems.addObject(lsFeature.objectAtIndex(index))
            }
        }
        
        return lsItems
    }
}

