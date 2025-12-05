//
//  FavoritesViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import Foundation

@MainActor @Observable
final class FavoritesViewModel {
    var favoriteCount: Int = 0
    var hasNoFavorites: Bool = true
    
    private(set) var favorites: Set<String> = [] {
        didSet {
            favoriteCount = favorites.count
            hasNoFavorites = favorites.isEmpty
        }
    }
    
    func toggleFavorite(filmId: String) {
        if isFavorite(filmId: filmId) {
            favorites.remove(filmId)
        } else {
            favorites.insert(filmId)
        }
    }
    
    func isFavorite(filmId: String) -> Bool {
        favorites.contains(filmId)
    }
}
