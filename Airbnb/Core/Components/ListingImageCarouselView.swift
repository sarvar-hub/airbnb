//
//  ListingImageCarouselView.swift
//  Airbnb
//
//  Created by sarvar on 1/7/2026.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var listing: Listing
    
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) {image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
