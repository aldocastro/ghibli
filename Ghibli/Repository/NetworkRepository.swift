//
//  NetworkRepository.swift
//  Ghibli
//
//  Created by Aldo Castro on 29.11.25.
//

import Foundation

protocol NetworkRepository {
    func getFilms() async throws (NetworkError) -> [Film]
    func getFilm(id: String) async throws (NetworkError) -> Film
}

struct Network: NetworkRepository, NetworkInteractor {
    func getFilms() async throws(NetworkError) -> [Film] {
        try await getJson(request: URLRequest.get(url: URL.films))
    }
    
    func getFilm(id: String) async throws(NetworkError) -> Film {
        try await getJson(request: URLRequest.get(url: URL.film(id: id)))
    }
}
