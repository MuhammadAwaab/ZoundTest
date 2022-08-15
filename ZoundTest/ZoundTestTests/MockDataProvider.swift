//
//  MockDataProvider.swift
//  ZoundTestTests
//
//  Created by Muhammad Oneeb on 15/08/2022.
//

import Foundation

class MockDataProvider: DataProviderProtocol {
    func fetchAndProvideData(completion: @escaping ([CryptoModel]?) -> Void) {
        if let path = Bundle.main.path(forResource: "SampleData", ofType: "json") {
                  do {
                      let fileUrl = URL(fileURLWithPath: path)
                      // Getting data from JSON file using the file URL
                      let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
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
                      
                  } catch {
                      // Handle error here
                      print("error parsing local json...")
                      completion(nil)
                  }
              }
    }
    
    
}
