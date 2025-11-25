//
//  NetworkInteractor.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

protocol NetworkInteractor {}

extension NetworkInteractor {
    func getJson<T: Codable>(request: URLRequest) async throws (NetworkError) -> T {
        let result: DataAndResponse = try await URLSession.shared.getData(for: request)
        if result.httpResponse.statusCode == 200 {
            do {
                return try JSONDecoder().decode(T.self, from: result.data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(result.httpResponse.statusCode)
        }
    }
}
