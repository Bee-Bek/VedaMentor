//
//  UserFacingError.swift
//  VedaMentor
//
//  Created by Bibek upreti on 24/12/2025.
//

import Foundation

enum UserFacingError: LocalizedError, Equatable {
    case noInternet
    case sessionExpired
    case unauthorized
    case serverUnavailable
    case somethingWentWrong
    
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return NSLocalizedString("error.no_internet", comment: "")
        case .sessionExpired:
            return NSLocalizedString("error.session_expired", comment: "")
        case .unauthorized:
            return NSLocalizedString("error.unauthorized", comment: "")
        case .serverUnavailable:
            return NSLocalizedString("error.server_unavailable", comment: "")
        case .somethingWentWrong:
            return NSLocalizedString("error.generic", comment: "")
        }
    }
}
