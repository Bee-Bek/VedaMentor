//
//  ErrorPresenter.swift
//  VedaMentor
//
//  Created by Bibek upreti on 24/12/2025.
//

import ComposableArchitecture

struct ErrorPresenter {
    
    // Map technical error to user-facing error
    static func map(_ error: AppNetworkError) -> UserFacingError {
        switch error {
        case .network(.noInternet):
            return .noInternet
            
        case .security(.sessionExpired),
                .security(.tokenExpired):
            return .sessionExpired
            
        case .client(.unauthorized):
            return .unauthorized
            
        case .server:
            return .serverUnavailable
            
        default:
            return .somethingWentWrong
        }
    }
    
    // Generate AlertState for TCA
    static func makeAlert<Action: Equatable>(from error: AppNetworkError) -> AlertState<Action> {
        
        let userError = map(error)
        
        return AlertState {
            TextState(userError.localizedDescription)
        } actions: {
            ButtonState(role: .cancel, action: .init()) { // dismiss handled in reducer
                TextState(NSLocalizedString("ok", comment: ""))
            }
            
            if isRetryable(error) {
                ButtonState(action: .init()) { // retry handled in reducer
                    TextState(NSLocalizedString("retry", comment: ""))
                }
            }
        }
    }
    
    // Decide if retry button should appear
    static func isRetryable(_ error: AppNetworkError) -> Bool {
        switch error {
        case .network, .server:
            return true
        default:
            return false
        }
    }
}
