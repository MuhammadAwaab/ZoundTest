//
//  DataProvider.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

protocol DataProviderProtocol {
    func fetchAndProvideData(completion: @escaping(_ serverData: [CryptoModel]?) -> Void)
}

class DataProvider: DataProviderProtocol {
    func fetchAndProvideData(completion: @escaping ([CryptoModel]?) -> Void) {
        let provider = ServiceProvider<SampleService>()
        
        provider.load(service: .fetchSampleProjectData) { result in
            switch result {
            case .success(let data):
                do {
                    if let someDataArrayFromJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] {
                        var parsedDataArray: [CryptoModel] = []
                        let jsonDecoder = JSONDecoder()
                        for dataDictionary in someDataArrayFromJSON {
                            let jsonData = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
                            let responseModel = try jsonDecoder.decode(CryptoModel.self, from: jsonData)
                            parsedDataArray.append(responseModel)
                        }
                        
                        completion(parsedDataArray)
                    }
                    
                    completion(nil)
                    
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
