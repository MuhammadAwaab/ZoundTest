//
//  ItemViewModel.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

protocol ItemViewModelProtocol {
    func currencyNameForDisplay() -> String
}

class ItemViewModel: ItemViewModelProtocol {
    
    private let dataModelToDisplay: CryptoModel
    
    init(dataModel: CryptoModel){
        self.dataModelToDisplay = dataModel
    }
    
    func currencyNameForDisplay() -> String {
        return dataModelToDisplay.baseAsset?.uppercased() ?? ""
    }
    
}
