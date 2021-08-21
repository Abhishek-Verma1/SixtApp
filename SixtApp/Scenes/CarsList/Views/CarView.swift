//
//  CarView.swift
//  SixtApp
//
//  Created by Abhishek Verma on 21/08/2021.
//

import Foundation
import SwiftUI
import URLImage

struct CarView: View {
    let car: CarModel
    
    var body: some View {
        HStack {
            if let imageURL = car.carImageUrl,
               let url = URL(string: imageURL) {
                URLImage(url,
                         failure: { error, _ in
                            PlaceholderImageView()
                         },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                    .frame(width: 50, height: 50)
                    //.cornerRadius(10)
              
            } else {
                PlaceholderImageView()
            }
            VStack(alignment: .leading, spacing: 4, content: {
                //Text(article.name + " " + article.modelName + " " + article.color)
                Text(car.name ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(car.licensePlate ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            })
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView(car: CarModel.dummyData)
            .previewLayout(.sizeThatFits)
    }
}

extension CarModel {
    static var dummyData: CarModel {
        undefined()
    }
}

func undefined<T>() -> T {
    fatalError("undefined")
}


