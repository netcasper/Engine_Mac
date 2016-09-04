//
//  DataRetriever.swift
//  Engine
//
//  Created by Wang William on 16/8/28.
//  Copyright © 2016年 Wang William. All rights reserved.
//

import Foundation

class DataRetriever {
    var output = "Engine"
    
    func RetrieveData(source: String, items: [String]) {
        var requestString = AppConst.XL_URL;    // http://hq.sinajs.cn/list=
        for item in items {
            if !item.isEmpty && item.lengthOfBytesUsingEncoding(NSWindowsCP1250StringEncoding) > 0 {
                if item.substringToIndex(item.startIndex.advancedBy(1)) == AppConst.SH_STOCK_PREFIX
                    || item.substringToIndex(item.startIndex.advancedBy(1)) == AppConst.SH_ETF_PREFIX
                    || item == AppConst.SHZS {
                    requestString += AppConst.XL_LONG_PREFIX_SH + item + AppConst.XL_ITEM_SEPARATOR
                } else {
                    requestString += AppConst.XL_LONG_PREFIX_SZ + item + AppConst.XL_ITEM_SEPARATOR
                }
            }
        }
        
        let url = NSURL(string: requestString)
        let request = NSURLRequest(URL: url!)
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let error = error {
                print(error)
            } else if let data = data,
                let string = String(data: data, encoding: NSWindowsCP1250StringEncoding) {
                self.output = string
                print("DataRetriever: self.output = " + string.substringToIndex(string.startIndex.advancedBy(20)))
            }
        })
        task.resume()
    }

    func BuildURL_XL() -> String {
        return ""
    }
}
