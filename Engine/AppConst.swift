//
//  Appstatic let swift
//  Engine
//
//  Created by Wang William on 16/8/28.
//  Copyright © 2016年 Wang William. All rights reserved.
//

class AppConst {
    static let DEFAULT_TITLE = "Engine"
    static let MODE_DEFAULT = "0"
    static let MODE_TINY = "0"
    static let MODE_SIMPLE = "1"
    static let MODE_FULL = "2"
    
    static let SOURCE_DEFAULT = "0"
    static let SOURCE_XL = "0"
    static let SOURCE_TX = "1"
    static let SOURCE_WY = "2"
    
    static let USAGE = "Usage: >python engine_main [0|1|2] [0|1|2] #[tiny|simple|full] [XL|TX|WY]"
    
    static let XL_URL = "http://hq.sinajs.cn/list="
    static let TX_URL = "http://qt.gtimg.cn/q="
    static let WY_URL = "http://api.money.126.net/data/feed/"
    static let XL_SHORT_PREFIX_SH = "s_sh"
    static let XL_SHORT_PREFIX_SZ = "s_sz"
    static let XL_LONG_PREFIX_SH = "sh"
    static let XL_LONG_PREFIX_SZ = "sz"
    static let TX_SHORT_PREFIX_SH = "s_sh"
    static let TX_SHORT_PREFIX_SZ = "s_sz"
    static let TX_LONG_PREFIX_SH = "sh"
    static let TX_LONG_PREFIX_SZ = "sz"
    static let WY_SHORT_PREFIX_SH = "0"
    static let WY_SHORT_PREFIX_SZ = "1"
    static let WY_LONG_PREFIX_SH = "0"
    static let WY_LONG_PREFIX_SZ = "1"
    static let XL_ITEM_SEPARATOR = ","
    static let TX_ITEM_SEPARATOR = ","
    static let WY_ITEM_SEPARATOR = ","
    
    static let SHZS = "000001"
    static let SZZS = "399001"
    static let CYBZ = "399006"
    static let ETFCYB = "159915"
    static let ETF50 = "510050"
    static let SH_STOCK_PREFIX = "6"
    static let SH_ETF_PREFIX = "5"
    
    static let TINY_LIST = "159915 000001 510050"
    static let STOCK_LIST = "159915 510050 600026"
    static let INDEX_LIST = "000001 399001 399006"
    
    static let ITEM_SEPARATOR = " | "
    static let FIELD_SEPARATOR = "/"
    static let SIMPLE_SEPARATOR = "\t"
    static let FULL_SEPARATOR = "\t\t"
    
    static let SELL_SEPARATOR = "   "
    static let BUY_SEPARATOR = " ^ "
    static let INDEX_STOCK_SEPARATOR = "-------------------------------------------------------------\r\n"
    
    static let INTERVAL = 1.0
}
