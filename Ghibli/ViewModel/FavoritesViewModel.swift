//
//  FavoritesViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 30.11.25.
//

import Foundation

@MainActor @Observable
final class FavoritesViewModel {
    private var favorites: Set<String> = []
    
    var isFavoriteListEmpty: Bool {
        favorites.isEmpty
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
