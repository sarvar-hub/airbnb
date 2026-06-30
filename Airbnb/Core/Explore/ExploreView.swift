//
//  ExploreView.swift
//  Airbnb
//
//  Created by sarvar on 30/6/2026.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                SearchAndFilterBar()
                
                ScrollView {
                    LazyVStack (spacing: 32) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
