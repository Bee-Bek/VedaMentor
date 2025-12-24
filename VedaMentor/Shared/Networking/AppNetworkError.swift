//
//  URLSessionError.swift
//  VedaMentor
//
//  Created by Bibek upreti on 24/12/2025.
//

// Shared/Networking/AppNetworkError.swift

import Foundation

enum AppNetworkError: Error, Equatable {
    case network(NetworkError)
    case request(RequestError)
    case client(ClientError)
    case server(ServerError)
    case response(ResponseError)
    case decoding
    case api(APIError)
    case security(SecurityError)
    case unknown
}

// Network / Transport errors
enum NetworkError: Error, Equatable {
    case noInternet
    case timeout
    case connectionLost
    case cancelled
}

// Request construction errors
enum RequestError: Error, Equatable {
    case invalidURL
    case encodingFailed
    case missingHeaders
}

// Client (4xx) errors
enum ClientError: Error, Equatable {
    case badRequest        // 400
    case unauthorized      // 401
    case forbidden         // 403
    case notFound          // 404
    case conflict          // 409
    case rateLimited       // 429
}

// Server (5xx) errors
enum ServerError: Error, Equatable {
    case internalServer    // 500
    case badGateway        // 502
    case serviceUnavailable // 503
}

// Response validation errors
enum ResponseError: Error, Equatable {
    case emptyData
    case invalidResponse
    case unexpectedStatusCode(Int)
}

// API-defined business errors
enum APIError: Error, Equatable {
    case invalidCredentials
    case accountLocked
}

// Security / session errors
enum SecurityError: Error, Equatable {
    case sessionExpired
    case tokenExpired
}

