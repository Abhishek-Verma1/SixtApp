//
//  CarModel.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation

struct CarModel: Codable, Identifiable {
    let id: String?
    let modelIdentifier: String?
    let modelName: String?
    let name: String?
    let make: String?
    let group: String?
    let color: String?
    let series: String?
    let fuelType: String?
    let fuelLevel: Float?
    let transmission: String?
    let licensePlate: String?
    let latitude: Double?
    let longitude: Double?
    let innerCleanliness: String?
    let carImageUrl: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
