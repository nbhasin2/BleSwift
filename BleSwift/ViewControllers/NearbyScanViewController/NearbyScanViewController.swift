//
//  NearbyScanViewController.swift
//  BleSwift
//
//  Created by Nishant on 2016-04-25.
//  Copyright © 2016 Epicara. All rights reserved.
//

import Foundation
import UIKit

class NearbyScanViewController: UIViewController
{
    
    // MARK: - View Outlets
    
    @IBOutlet weak var overlayView: UIView!
    
    @IBOutlet weak var nearByScanTableView: UITableView!
    
    // MARK: - Variables
    
    var bleManager: BleManager?
    
    // MARK: - Constants
    
    private let controllerTitle = "Nearby Devices"
    private let defaultCellHeight: CGFloat = 63.0
    
    //  Cell Identifiers
    
    private let nearbyScanViewIdentifier = "nearByScanViewCellIdentifier"
    
    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        self.edgesForExtendedLayout = UIRectEdge.None
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // UI related methods
    
    func setupView()
    {
        // Title
        self.title = controllerTitle
        
        // Setting back button to no text
        self.navigationController?.navigationBar.topItem?.title = ""
        
        setupTableView()
        startScanForDevices()
    }
    
    func setupTableView()
    {
        self.nearByScanTableView.registerNib(UINib(nibName: "NearByScanViewCell", bundle: nil), forCellReuseIdentifier: self.nearbyScanViewIdentifier)
        self.nearByScanTableView.rowHeight = UITableViewAutomaticDimension
        self.nearByScanTableView.estimatedRowHeight = self.defaultCellHeight
        self.nearByScanTableView.separatorInset = UIEdgeInsetsZero
        self.nearByScanTableView.separatorStyle = .None
    }
    
    func overlayViewVisibility(isVisible: Bool)
    {
        if(isVisible)
        {
            overlayView.fadeIn()
        }
        else
        {
            overlayView.fadeOut()
        }
    }
    
    // Model methods
    
    func startScanForDevices()
    {
//        bleManager = BleManager()
        overlayViewVisibility(true)
    }
    
    func stopScanForDevices()
    {
        overlayViewVisibility(false)
    }
    
    func updateTableWithDeviceInfo()
    {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK: - BleManager delegate 

extension NearbyScanViewController: BleManagerDelegate
{
    func didDiscoverDevice(deviceName:String?)
    {
        print("\(deviceName)")
        stopScanForDevices()
    }
}

// MARK: - Tableview delegate and datasource

extension NearbyScanViewController: UITableViewDelegate, UITableViewDataSource
{
    
    // UITableViewDelegate
//    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return defaultCellHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Push to ConnectViewController
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        // Return proper cell with text
        return self.configureCell(tableView, cellForRowAtindexpath: indexPath)
    }
    
    // Helper methods 
    
    func configureCell(tableView:UITableView, cellForRowAtindexpath indexPath: NSIndexPath) -> UITableViewCell
    {

        if let cell = tableView.dequeueReusableCellWithIdentifier(self.nearbyScanViewIdentifier) as! NearByScanViewCell!
        {
            cell.setCellText("MyText \(indexPath.row)")
            
            return cell
        }
        
        return UITableViewCell(style: .Default, reuseIdentifier: "emptyCell")
    }
    
    
}