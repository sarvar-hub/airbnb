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
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
