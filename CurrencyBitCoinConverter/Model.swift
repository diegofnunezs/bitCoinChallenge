//
//  Model.swift
//  CurrencyBitCoinConverter
//
//  Created by practica on 20/11/17.
//  Copyright © 2017 UTADEO. All rights reserved.
//

import Foundation
struct model {
    let currencyArray = ["AUD","BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","COP","MXN","CRC"]
    let signos =        ["$ " ,"R$ ","$ " , "¥ ","€ " , "£ ", "$ ","Rp ","₪ " ,"₹ " , "¥ ", "$ ","kr ", "$ ","zł ","lei ","₽ ", "$ ", "$ ","$ " ]
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    func currencyArray2(row: Int) -> String {
        return currencyArray[row]
    }
    func signos(row: Int) -> String {
        return signos[row]
    }
    
    func numElements() -> Int {
        return currencyArray.count
    }
    

    
}
