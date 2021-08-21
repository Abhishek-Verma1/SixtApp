//
//  CarsListView.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import SwiftUI

struct CarsListView: View {
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel = CarsListViewModel()
    @State var showSheetView = false
    
    var body: some View {
                Group {
                    switch viewModel.state {
                    case .loading:
                        ProgressView()
                    case .failed(let error):
                        ErrorView(error: error, handler: viewModel.getCarsList)
                    case .success(let cars):
                        NavigationView {
                            List(cars) { item in
                                CarView(car: item)
                                    .onTapGesture {
                                        load(url: item.carImageUrl)
                                    }
                            }
                            .navigationTitle(Text(ScreenTitle.CarsListView))
                            .toolbar {
                                Button("Map") {
                                    self.showSheetView.toggle()
                            }
                          }
                        }
                    }
                }
        .sheet(isPresented: $showSheetView) {
            MapView(viewModel: viewModel)
        }
        .onAppear {
            self.viewModel.getCarsList()
        }
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openURL(url)
    }
    
    struct CarsListView_Previews: PreviewProvider {
        static var previews: some View {
            CarsListView()
        }
    }
}
