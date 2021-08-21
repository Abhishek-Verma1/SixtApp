//
//  MapViewUI.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import SwiftUI
import MapKit
import Combine
import CoreLocation

struct MapView: View {
    @ObservedObject var viewModel = CarsListViewModel()
    @State private var region = MKCoordinateRegion.defaultRegion
    
    var body: some View {
        VStack{
            Text(ScreenTitle.MapView)
                .font(.headline)
                .padding()
            
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: viewModel.cars) { annotation in
                
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude ?? 0.0, longitude: annotation.longitude ?? 0.0)) {
                    Image(IconName.placeHolder)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            //print("Hi")
                        }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension MKCoordinateRegion {
    static var defaultRegion: MKCoordinateRegion {
        //Default location: latitude: 48.137154, longitude: 11.576124
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 48.137154, longitude: 11.576124), span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07))
    }
}

