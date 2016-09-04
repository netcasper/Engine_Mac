//
//  AppSettings.swift
//  Engine
//
//  Created by Wang William on 16/9/4.
//  Copyright © 2016年 Wang William. All rights reserved.
//

import Foundation

class AppSettings {
    var pause = false
    var stockItems = [String]()
    var show159915 = true
    var show000001 = true
    var show510050 = true
    var showPrice = true
    var showRatio = true
    var showAmount = false
    
    init() {
        UpdateList()
    }
    
    func UpdateList() {
        stockItems.removeAll()
        if show159915 {
            stockItems.append(AppConst.ETFCYB)
        }
        if show000001 {
            stockItems.append(AppConst.SHZS)
        }
        if show510050 {
            stockItems.append(AppConst.ETF50)
        }
    }
}