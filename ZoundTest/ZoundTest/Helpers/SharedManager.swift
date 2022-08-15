//
//  SharedManager.swift
//  ZoundTest
//
//  Created by Muhammad Oneeb on 15/08/2022.
//

import Foundation

class SharedManager {
    static let shared = SharedManager()
    var isShowingUSD: Bool = true

    private init() { }
}


extension String {
    func convertToSelectedCurrency() -> String {
        if SharedManager.shared.isShowingUSD == true {
            return self
        } else {
            let numberValue = Double(self) ?? 0.0
            return "\(round(1000 * (numberValue * 10.21)) / 1000)"
        }
    }
}
