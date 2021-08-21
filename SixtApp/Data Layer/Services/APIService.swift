//
//  APIService.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: APIBuilder) -> AnyPublisher<T, APIError>
}

