//
//  URLSession.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

typealias DataAndResponse = (data: Data, httpResponse: HTTPURLResponse)

extension URLSession {
    func getData(for request: URLRequest) async throws (NetworkError) -> DataAndResponse {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.nonHTTP }
            return (data, httpResponse)
        } catch {
            throw NetworkError.general(error)
        }
    }
}
