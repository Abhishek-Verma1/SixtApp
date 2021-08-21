//
//  ResultState.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation

enum ResultState<T> {
    case loading
    case success(content: T)
    case failed(error: Error)
}
