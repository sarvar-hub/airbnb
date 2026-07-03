//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by sarvar on 3/7/2026.
//

import Foundation
import Combine

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let query = searchLocation.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty else {
            self.listings = listingsCopy
            return
        }
        
        let filteredListings = listingsCopy.filter({
            $0.city.lowercased().contains(query) ||
            $0.state.lowercased().contains(query)
        })
        
        self.listings = filteredListings
    }
}
