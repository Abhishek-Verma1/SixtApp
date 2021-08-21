//
//  CarService.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation
import Combine

protocol CarService {
    var apiSession: APIService {get}
    func getcarsList() -> AnyPublisher<[CarModel], APIError>
}

extension CarService {
    
    func getcarsList() -> AnyPublisher<[CarModel], APIError> {
        return apiSession.request(with: CarEndpoint.carsList)
            .eraseToAnyPublisher()
    }
}
