//
//  ViewController.swift
//  ZoundTest
//
//  Created by Muhammad Awaab on 14/08/2022.
//

import Foundation

let dataFetchUrl = "https://api.wazirx.com/sapi/v1/tickers/24hr"

enum SampleService {
    case fetchSampleProjectData
}


extension SampleService: Service {
    var baseURL: String {
        return "https://api.wazirx.com"
    }
    
    var path: String {
        return "/sapi/v1/tickers/24hr"
    }
    
    var parameters: [String: Any]? {
        // default params
        let params: [String: Any] = [:]
        
        return params
    }
    
    var method: ServiceMethod {
        return .get
    }
}
