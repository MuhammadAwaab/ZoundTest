//
//  MainViewModel.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

protocol MainViewModelProtocol {
    func fetchParsedDataForDisplay()
    func getCellViewModel(at indexPath: IndexPath) -> ItemViewModelProtocol
    func numberOfRowsToDisplay() -> Int
}


class MainViewModel: MainViewModelProtocol {
    
    
    private var currentProvider: DataProviderProtocol
    private let cellIdentifier = "DataCell"
    
    var cellViewModelsArray: [ItemViewModelProtocol] = [] {
        didSet{
            self.updateView?()
        }
    }
    
    var updateView:(() -> Void)?
    var showErrorAlertView:(() -> Void)?
    
    init(provider: DataProviderProtocol = DataProvider()){
        self.currentProvider = provider
    }
    
    
    func fetchParsedDataForDisplay() {
        self.currentProvider.fetchAndProvideData { data in
            if let parsedData = data, parsedData.count > 0 {
                self.updateCellModelViewsWith(parsedData: parsedData)
            } else {
                self.showErrorAlertView?()
            }
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> ItemViewModelProtocol {
        return cellViewModelsArray[indexPath.row]
    }
    
    func numberOfRowsToDisplay() -> Int {
        return cellViewModelsArray.count
    }
    
    private func updateCellModelViewsWith(parsedData: [CryptoModel]) {
        var arrayForModels: [ItemViewModelProtocol] = []
        for data in parsedData {
            arrayForModels.append(ItemViewModel(dataModel: data))
        }
        cellViewModelsArray = arrayForModels
    }
    
    
}
