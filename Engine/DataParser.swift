//
//  DataParser.swift
//  Engine
//
//  Created by Wang William on 16/8/28.
//  Copyright © 2016年 Wang William. All rights reserved.
//

import Foundation

class DataParser {
    func ParseData(input: String)->[DataItem] {
        var output = [DataItem]()
        
        if input.isEmpty {
            return output
        }
        
        let charset1 = NSCharacterSet(charactersInString: "\n")
        let charset2 = NSCharacterSet(charactersInString: ";")
        let temp = input.stringByTrimmingCharactersInSet(charset1)
        let items = temp.stringByTrimmingCharactersInSet(charset2).componentsSeparatedByString(";")
        
        for item in items {
            let outputItem = DataItem()
            var valuableParts = item.componentsSeparatedByString("=")
            if valuableParts.count == 2 {
                let header = valuableParts[0]
                if header.characters.count == 19 {
                    //outputItem.code = header.substringFromIndex(header.endIndex.advancedBy(6))
                }
                
                var fields = valuableParts[1].stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "\"")).componentsSeparatedByString(",")
                
                if fields.count == 33 {
                    outputItem.name = fields[0]
                    outputItem.price = FormatPrice(fields[3])
                    outputItem.ratio = GetRatio(fields[2], price: fields[3])
                    outputItem.high = fields[4]
                    outputItem.low = fields[5]
                    outputItem.amount = String(format:"%.2f", (fields[9] as NSString).floatValue / 100000000)
                }
            }
            output.append(outputItem)
        }
        
        print("DataParser: output.count = " + String(output.count))
        return output
    }
    
    func GetRatio(last: String, price: String) -> String {
        let lastFloat = (last as NSString).floatValue
        let priceFloat = (price as NSString).floatValue
        
        if  lastFloat == 0.0 || priceFloat == 0.0 {
            return "0.0"
        } else {
            let ratio = (priceFloat - lastFloat) / lastFloat * 100
            return String(format:"%.2f", ratio)
        }
    }
    
    func FormatPrice(price: String) -> String {
        let priceFloat = (price as NSString).floatValue
        if priceFloat > 9.99 {
            return String(format: "%.2f", priceFloat)
        } else {
            return price
        }
    }
}