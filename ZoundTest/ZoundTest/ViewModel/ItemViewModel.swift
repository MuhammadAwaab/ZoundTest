//
//  ItemViewModel.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

protocol ItemViewModelProtocol {
    func currencyNameForDisplay() -> String
    func currencyDescForDisplay() -> String
    func getLowPriceToDipslay() -> String
    func getHighPriceToDisplay() -> String
    func isOpenPriceLowerThanLastPrice() -> Bool
    func getCurrentOpenPrice() -> String
    func getCurrencyLabel() -> String
}

class ItemViewModel: ItemViewModelProtocol {
    func getCurrencyLabel() -> String {
        if isDisplayingUSD {
            return "/ USD"
        } else {
            return "/ SEK"
        }
    }
    
    func getCurrentOpenPrice() -> String {
        return dataModelToDisplay.openPrice ?? ""
    }
    
    func getLowPriceToDipslay() -> String {
        return dataModelToDisplay.lowPrice ?? ""
    }
    
    func getHighPriceToDisplay() -> String {
        return dataModelToDisplay.highPrice ?? ""
    }
    
    func isOpenPriceLowerThanLastPrice() -> Bool {
        let openPrice = Double(dataModelToDisplay.openPrice ?? "0.0")!
        let lastPrice = Double(dataModelToDisplay.lastPrice ?? "0.0")!
        
        if openPrice < lastPrice {
            return true
        } else {
            return false
        }
    }
    
    
    private let dataModelToDisplay: CryptoModel
    var isDisplayingUSD: Bool = true
    
    init(dataModel: CryptoModel){
        self.dataModelToDisplay = dataModel
    }
    
    func currencyNameForDisplay() -> String {
        return dataModelToDisplay.baseAsset?.uppercased() ?? ""
    }
    
    func currencyDescForDisplay() -> String {
        return dataModelToDisplay.symbol ?? ""
    }
    
}
