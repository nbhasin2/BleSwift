//
//  BleManager.swift
//  Snackbar
//
//  Created by Nishant on 2016-04-24.
//  Copyright © 2016 Epicara. All rights reserved.
//

/*
 1. Scan for peripherial 
 2. Once peripheral is found you try to connect
 3. Once connected you try to discover servies of peripheral
 4. Once peripheral services are discovered you discover characteristic
 5. Once characteristic is discovered you save that value
 */

import Foundation
import CoreBluetooth

struct peripheralData {
    var peripheralID: CBUUID?
    var servicesDiscovered = [CBService]()
    
    // Key = CBService and value is an array of CBCharacteristic for that service
    var characteristicDiscovered = [CBService: [CBCharacteristic]]()
}

/// Protocol of `ImageDownloader`.
@objc public protocol BleManagerDelegate
{
    optional func didDiscoverDevice(deviceName:String?)
}

class BleManager : NSObject, CBCentralManagerDelegate, CBPeripheralDelegate
{
    // MARK: - Variables
    
    var centralManager: CBCentralManager?
    var peripheral: CBPeripheral?
    var characteristic: CBCharacteristic?
    
    // List of services
    
    var discoveredPeripheral = [CBPeripheral]()
    
    var connectedPeripheral = [CBPeripheral]()
    
    var fullyConnectedPeripheral = [peripheralData]()
    
    // MARK: - Constants
    
    let serviceType = CBUUID(string: "")
    let characteristicType = CBUUID(string: "")
    
    // Delegate
    
    var bleManagerDelegate: BleManagerDelegate?
    
    // MARK: - Initialization
    
    override init()
    {
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
    
    func startScan()
    {
        // Scanning peripherial with specific service
        // self.centralManager!.scanForPeripheralsWithServices([serviceType], options: nil)
        
        // Scanning all peripherial
        self.centralManager!.scanForPeripheralsWithServices(nil, options: nil)
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
    
    // Discover peripheral
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        print(peripheral.name)
        
        // Add to discovered peripheral list
        
        discoveredPeripheral.append(peripheral)
        
        // Connect to peripheral once discovered
        
        self.peripheral = peripheral
        central.connectPeripheral(peripheral, options: nil)
        
        // Notify viewcontroller 
        
        bleManagerDelegate?.didDiscoverDevice?(peripheral.name)
    }
    
    // Connected peripheral
    
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
        peripheral.delegate = self
        
        // Add to connected list
        connectedPeripheral.append(peripheral)
        
        // Discover specific service for that peripheral 
        
        // peripheral.discoverServices([serviceType])
        
        // Discover all services for that peripheral 
        
        peripheral.discoverServices(nil)

    }
    
    
    //  CBPeripheralDelegate
    
    //  Peripheral service discovered 
    
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?)
    {
        // Discover a particular characteristic for that peripheral 
        
        // peripheral.discoverCharacteristics([characteristicType], forService: peripheral.services!.first! as CBService)
        
        // Discover all characteristic for that peripheral
        
        peripheral.discoverCharacteristics(nil, forService: peripheral.services!.first! as CBService)
    }
    
    // Find characteristic and assign value
    
    func peripheral(peripheral: CBPeripheral, didDiscoverCharacteristicsForService service: CBService, error: NSError?)
    {
        // Assign value of a single characteristic we were looking for 
        
        characteristic = service.characteristics!.first as CBCharacteristic?
    }
    
    
}