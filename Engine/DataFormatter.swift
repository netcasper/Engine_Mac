//
//  DataFormatter.swift
//  Engine
//
//  Created by Wang William on 16/8/28.
//  Copyright © 2016年 Wang William. All rights reserved.
//

import Foundation

class DataFormatter {
    func FormatData(_ items: [DataItem], settings: AppSettings)-> String {
        var output = ""
        let charsetFieldSeparator = CharacterSet(charactersIn: "/")
        let charsetItemSeparator = CharacterSet(charactersIn: " | ")
        print("DataFormatter: items.count = " + String(items.count))
        if items.count == 0 {
            return "Error"
        }
        
        for i in 0...items.count-1 {
            if settings.showPrice {
                output = output + items[i].price
                output = output + "/"
            }
            if settings.showRatio {
                output = output + items[i].ratio
                output = output + "/"
            }
            if settings.showAmount {
                output = output + items[i].amount
                output = output + "/"
            }
            output = output.trimmingCharacters(in: charsetFieldSeparator)
            output = output + " | "
        }
        
        return output.trimmingCharacters(in: charsetItemSeparator)
    }
}
