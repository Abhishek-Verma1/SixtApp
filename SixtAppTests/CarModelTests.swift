//
//  CarModelTests.swift
//  SixtAppTests
//
//  Created by Abhishek Verma on 21/08/2021.
//
import XCTest

@testable import SixtApp

class CarModelTests: XCTestCase {
    
    var carModel: CarModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        carModel = CarModel(id: "WMWSW31030T222518", modelIdentifier: "mini", modelName: "MINI", name: "Vanessa", make: "BMW", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", fuelLevel: 0.7, transmission: "M", licensePlate: "M-VO0259", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        carModel = nil
        super.tearDown()
    }

     
    func testCarModelInit() {
        carModel = CarModel(id: "WMWSW31030T222518", modelIdentifier: "mini", modelName: "MINI", name: "Vanessa", make: "BMW", group: "MINI", color: "midnight_black", series: "MINI", fuelType: "D", fuelLevel: 0.7, transmission: "M", licensePlate: "M-VO0259", latitude: 48.134557, longitude: 11.576921, innerCleanliness: "REGULAR", carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png")
        XCTAssertNotNil(carModel)
    }
    
    
}

