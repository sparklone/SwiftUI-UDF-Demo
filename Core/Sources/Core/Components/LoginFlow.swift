public enum LoginFlow {
    case none
    case token(UUID)
    case validation(UUID)
    case session(UUID)
    
    init() { self = .none }
    
    mutating func reduce(_ action: Action) {
        if action is ActionLogin {
            self = .token(UUID())
        } else if action is ReceiveToken {
            self = .validation(UUID())
        } else if action is TokenValidated {
            self = .session(UUID())
        } else if action is TokenRequestFailed {
            self = .none
        } else if action is InvalidCredentials {
            self = .none
        } else if action is TokenValidationFailed {
            self = .none
        } else if action is ReceiveSession {
            self = .none
        } else if action is SessionRequestFailed {
            self = .none
        }
    }
}

public enum LoginStatus {
    case none
    case inProgress
    case invalidCredentials
    case success
    case failed
    
    init() { self = .none }
    
    mutating func reduce(_ action: Action) {
        if action is ActionLogin {
            self = .inProgress
        } else if action is TokenRequestFailed {
            self = .failed
        } else if action is InvalidCredentials {
            self = .invalidCredentials
        } else if action is TokenValidationFailed {
            self = .failed
        } else if action is ReceiveSession {
            self = .success
        } else if action is SessionRequestFailed {
            self = .failed
        } else if action is Logout {
            self = .none
        }
    }
}
