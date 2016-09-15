//
//  AppDelegate.swift
//  Engine
//
//  Created by Wang William on 8/28/16.
//  Copyright © 2016 Wang William. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var itemPause: NSMenuItem!
    @IBOutlet weak var item159915: NSMenuItem!
    @IBOutlet weak var item000001: NSMenuItem!
    @IBOutlet weak var item510050: NSMenuItem!
    @IBOutlet weak var itemPrice: NSMenuItem!
    @IBOutlet weak var itemRatio: NSMenuItem!
    @IBOutlet weak var itemAmount: NSMenuItem!

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusBar = NSStatusBar.system().statusItem(withLength: -1)
    
    var appSettings = AppSettings()
    var dataRetriever = DataRetriever()
    var dataParser = DataParser()
    var dataFormatter = DataFormatter()
    var paused = false
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Setup status menu and defaul content
        statusBar.title = AppConst.DEFAULT_TITLE
        statusBar.menu = statusMenu
        
        // Update menu items
        itemPause.state = appSettings.pause ? 1 : 0
        item159915.state = appSettings.show159915 ? 1 : 0
        item000001.state = appSettings.show000001 ? 1 : 0
        item510050.state = appSettings.show510050 ? 1 : 0
        itemPrice.state = appSettings.showPrice ? 1 : 0
        itemRatio.state = appSettings.showRatio ? 1 : 0
        itemAmount.state = appSettings.showAmount ? 1 : 0
        
        // Update status bar content
        appSettings.UpdateList()
        updateStatusContent()
        
        sleep(UInt32(AppConst.INTERVAL))
        
        // Start loop
        Timer.scheduledTimer(timeInterval: AppConst.INTERVAL, target: self, selector: #selector(AppDelegate.tick), userInfo: nil, repeats: true)
    }
    
    func tick() {
        if appSettings.pause {
            return
        }
        
        if checkDateTime() {
            updateStatusContent()
        }
    }
    
    func updateStatusContent() {
        dataRetriever.RetrieveData(AppConst.SOURCE_XL, items: appSettings.stockItems)
        let parsedData = dataParser.ParseData(dataRetriever.output)
        let output = dataFormatter.FormatData(parsedData, settings: appSettings)
        statusBar.title = output.isEmpty ? AppConst.DEFAULT_TITLE : output
    }
    
    func checkDateTime() -> Bool {
        return true // TODO: in problem. need to dig into
        let dc = DateComponents()
        
        print(String(format:"%d", dc.weekday!))
        print(String(format:"%d", dc.hour!))
        print(String(format:"%d", dc.minute!))
        
        if dc.weekday == 6 || dc.weekday == 7 {
            return false
        } else if dc.hour! < 9 || dc.hour! > 15 {
            return false
        } else if dc.hour! == 9 && dc.minute! < 10 {
            return false
        } else if dc.hour! == 15 && dc.minute! > 5 {
            return false
        } else if dc.hour! == 11 && dc.minute! > 35 {
            return false
        } else if dc.hour! == 12 && dc.minute! < 55 {
            return false
        } else {
            return true
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func togglePause(_ sender: AnyObject) {
        appSettings.pause = !appSettings.pause
        itemPause.state = appSettings.pause ? 1 : 0
    }
    
    @IBAction func toggle159915(_ sender: NSMenuItem) {
        appSettings.show159915 = !appSettings.show159915
        appSettings.UpdateList()
        item159915.state = appSettings.show159915 ? 1 : 0
    }
    
    
    @IBAction func toggle000001(_ sender: NSMenuItem) {
        appSettings.show000001 = !appSettings.show000001
        appSettings.UpdateList()
        item000001.state = appSettings.show000001 ? 1 : 0
    }
    
    @IBAction func toggle510050(_ sender: NSMenuItem) {
        appSettings.show510050 = !appSettings.show510050
        appSettings.UpdateList()
        item510050.state = appSettings.show510050 ? 1 : 0
    }
    
    
    @IBAction func togglePrice(_ sender: NSMenuItem) {
        appSettings.showPrice = !appSettings.showPrice
        itemPrice.state = appSettings.showPrice ? 1 : 0
    }
    
    @IBAction func toggleRatio(_ sender: NSMenuItem) {
        appSettings.showRatio = !appSettings.showRatio
        itemRatio.state = appSettings.showRatio ? 1 : 0
    }
    
    @IBAction func toggleAmount(_ sender: NSMenuItem) {
        appSettings.showAmount = !appSettings.showAmount
        itemAmount.state = appSettings.showAmount ? 1 : 0
    }
    
    @IBAction func quitApplication(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self);
    }
}


