//
//  CarsListViewModel.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation
import Combine
import SwiftUI

class CarsListViewModel: ObservableObject, CarService {
    
    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    @Published var cars = [CarModel]()
    @Published private(set) var state: ResultState<[CarModel]> = .loading

    init(apiSession: APIService = Service()) {
        self.apiSession = apiSession
    }
    
    func getCarsList() {
        
        self.state = .loading
        let cancellable = self.getcarsList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                    self.state = .failed(error: error)
                case .finished:
                    self.state = .success(content: self.cars)
                    break
                }
                
            }) { (car) in
                self.cars = car
        }
        cancellables.insert(cancellable)
    }
}

