//
//  BleManager.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-24.
//  Copyright © 2016 Epicara. All rights reserved.
//

import Foundation
import CoreBluetooth

/// Protocol of `ImageDownloader`.
@objc public protocol BleManagerDelegate
{
    optional func didDiscoverDevice(deviceName:String?)
}

class BleManager : NSObject, CBCentralManagerDelegate
{
    // MARK: - Variables
    
    var centralManager: CBCentralManager?
    
    // Delegate
    
    var bleManagerDelegate: BleManagerDelegate?
    
    // MARK: - Initiazers
    
    override init() {
        super.init()
        initBleManager()
    }
    
    func initBleManager()
    {
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // MARK: - Helpers
    
    func stopScan()
    {
        self.centralManager?.stopScan()
    }
    
    // MARK: - CBCentralManagerDelegate
    
    func centralManagerDidUpdateState(central: CBCentralManager)
    {
        switch central.state {
        case CBCentralManagerState.Unsupported:
            print("")
        case CBCentralManagerState.Unauthorized:
            print("")
        case CBCentralManagerState.Unknown:
            print("")
        case CBCentralManagerState.Resetting:
            print("")
        case CBCentralManagerState.PoweredOff:
            print("")
        case CBCentralManagerState.PoweredOn:
            print("")
            // Start scaning
            centralManager?.scanForPeripheralsWithServices(nil, options: nil)
        }
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        print(peripheral.name)
        
        bleManagerDelegate?.didDiscoverDevice?(peripheral.name)
    }
}