//
//  ExploreService.swift
//  Airbnb
//
//  Created by sarvar on 3/7/2026.
//

import Foundation

class ExploreService {
   func fetchListings() async throws -> [Listing] {
       return DeveloperPreview.shared.listings
    }
}
