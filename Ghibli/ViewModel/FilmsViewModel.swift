//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import Foundation

enum ViewState {
    case loading, loaded, empty
}

@Observable @MainActor
final class FilmsViewModel {
    let repository: NetworkRepository = Network()
    
    private var films: [Film] = []
    private var state: ViewState = .loading
    private var showError: Bool = false
    private var errorMsg: String = ""
    
    func getFilms() async -> [Film] {
        state = .loading
        do {
            films = try await repository.getFilms()
            state = films.count > 0 ? .loaded : .empty
        } catch {
            state = .empty
            errorMsg = error.localizedDescription
            showError.toggle()
        }
        return films
    }
}
