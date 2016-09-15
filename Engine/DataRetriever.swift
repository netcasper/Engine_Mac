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
    
    func RetrieveData(_ source: String, items: [String]) {
        var requestString = AppConst.XL_URL;    // http://hq.sinajs.cn/list=
        for item in items {
            if !item.isEmpty && item.lengthOfBytes(using: String.Encoding.windowsCP1250) > 0 {
                if item.substring(to: item.characters.index(item.startIndex, offsetBy: 1)) == AppConst.SH_STOCK_PREFIX
                    || item.substring(to: item.characters.index(item.startIndex, offsetBy: 1)) == AppConst.SH_ETF_PREFIX
                    || item == AppConst.SHZS {
                    requestString += AppConst.XL_LONG_PREFIX_SH + item + AppConst.XL_ITEM_SEPARATOR
                } else {
                    requestString += AppConst.XL_LONG_PREFIX_SZ + item + AppConst.XL_ITEM_SEPARATOR
                }
            }
        }
        
        let url = URL(string: requestString)
        let request = URLRequest(url: url!)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error)
            } else if let data = data,
                let string = String(data: data, encoding: String.Encoding.windowsCP1250) {
                self.output = string
                print("DataRetriever: self.output = " + string.substring(to: string.characters.index(string.startIndex, offsetBy: 20)))
            }
        } as! (Data?, URLResponse?, Error?) -> Void)
        task.resume()
    }

    func BuildURL_XL() -> String {
        return ""
    }
}
