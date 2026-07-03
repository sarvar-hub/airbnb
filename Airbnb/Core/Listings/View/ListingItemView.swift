//
//  ListingView.swift
//  Airbnb
//
//  Created by sarvar on 30/6/2026.
//

import SwiftUI

struct ListingItemView: View {
  
    let listing: Listing
    
    var body: some View {
        VStack (spacing: 8) {
            // images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //listing details
            
            HStack(alignment: .top) {
                // details
                VStack (alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)

                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)

                    HStack (spacing: 4) {
                        Text("$\(listing.pricePerNight)").fontWeight(.semibold)
                        Text("night")
                    }
                }
                .foregroundStyle(.primary)

                Spacer()
                // rating
                HStack (spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.primary)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
