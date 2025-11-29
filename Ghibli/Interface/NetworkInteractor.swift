//
//  NetworkInteractor.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

protocol NetworkInteractor {}

extension NetworkInteractor {
    func getJson<T>(request: URLRequest, withType type: T.Type) async throws (NetworkError) -> T where T: Codable  {
        let result: DataAndResponse = try await URLSession.shared.getData(for: request)
        if result.httpResponse.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: result.data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(result.httpResponse.statusCode)
        }
    }
}
