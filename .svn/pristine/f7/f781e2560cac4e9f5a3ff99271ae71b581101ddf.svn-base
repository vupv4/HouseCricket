//
//  ShopVC.swift
//  VPMTFramework
//
//  Created by Vu Phan on 8/17/16.
//  Copyright © 2016 beeTeam. All rights reserved.
//

import UIKit
import Charts

class ShopVC: UIViewController, IBaseView, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var btnNow: UIButton!
    @IBOutlet weak var btnLaterToday: UIButton!
    @IBOutlet weak var btnTomorrow: UIButton!
    @IBOutlet weak var tbvPackage: UITableView!
    
    var dayWeek: [String]!
    var lesson: [Double]!
    var lsPackage:NSMutableArray!
    var presenter:FeaturePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvPackage.dataSource = self
        tbvPackage.delegate = self
        // Get list all feature
        presenter = FeaturePresenter(delegate: self)
        presenter.getListPackage()
        
        dayWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        lesson = [10.0, 4.0, 6.0, 3.0, 9.0, 6.0, 4.0]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        setChart(dayWeek, values: lesson)
    }
    
    @IBAction func showNowChart(sender: AnyObject) {
        
    }
    
    @IBAction func showLaterTodayChart(sender: AnyObject) {
        
    }
    
    @IBAction func showTomorrowChart(sender: AnyObject) {
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y:values[i] ) // truc x
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Lesson")
        let chartData = BarChartData(dataSet: chartDataSet)
        
        barChartView.data = chartData
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    //TODO: Get List package from model
    func doOnSuccess(result: AnyObject?){
        lsPackage = result as! NSMutableArray
    }
    
    func doOnError(err: NSError?){
        print("Error when get packages!!!")
    }
    
    //TODO: Config cell
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lsPackage.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "packageCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? PackageCell
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: "PackageCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? PackageCell
        }
        
        cell?.lbIndex.text = String(indexPath.row + 1)
        cell?.lbName.text = lsPackage.objectAtIndex(indexPath.row) as? String
        
        return cell!
    }
}












