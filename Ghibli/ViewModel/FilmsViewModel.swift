//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import Foundation

enum ViewState {
    case loading, loaded([Film]), empty, error(Error)
}

@Observable @MainActor
final class FilmsViewModel {
    let repository: NetworkRepository = Network()

    private var films: [Film] = []
    private(set) var state: ViewState = .empty
    
    func loadFilms() async -> Void {
        state = .loading
        do {
            films = try await repository.getFilms()
            state = films.count > 0 ? .loaded(films) : .empty
        } catch {
            state = .error(error)
        }
    }
}
