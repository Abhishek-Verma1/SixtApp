//
//  APIBuilder.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation

let APIURLPrefix = "https://cdn.sixt.io/"

enum HttpMethod: String {
    case get = "GET"
}

protocol APIBuilder {
    var urlRequest: URLRequest {get}
}

extension CarEndpoint: APIBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .carsList:
            guard let url = URL(string: APIURLPrefix + "codingtask/cars")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}

