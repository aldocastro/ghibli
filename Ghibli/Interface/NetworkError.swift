//
//  NetworkError.swift
//  Ghibli
//
//  Created by Aldo Castro on 25.11.25.
//

import Foundation

enum NetworkError: LocalizedError {
    case general(Error)
    case nonHTTP
    case json(Error)
    case status(Int)
    case dataNotValid
    
    var errorDescription: String? {
        return switch self {
        case .general(let error):
            "\(error)"
        case .nonHTTP:
            "The response was not an HTTP response."
        case .json(let error):
            "Failed upon JSON serialization: \(error)"
        case .status(let code):
            "Invalid response status code: \(code)."
        case .dataNotValid:
            "Invalid response data."
        }
    }
}
