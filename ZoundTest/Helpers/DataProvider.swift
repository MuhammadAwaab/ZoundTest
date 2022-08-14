//
//  DataProvider.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

import Foundation

protocol DataProviderProtocol {
    func fetchAndProvideData(completion: @escaping(_ serverData: Data?) -> Void)
}

class DataProvider: DataProviderProtocol {
    func fetchAndProvideData(completion: @escaping (Data?) -> Void) {
        let provider = ServiceProvider<SampleService>()
        
        provider.load(service: .fetchSampleProjectData) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Data.self, from: data)
                    completion(responseModel)
                } catch  {
                    print("Serialization invalid error....")
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .empty:
                print("No data")
                completion(nil)
            }
        }
    }
    
}
