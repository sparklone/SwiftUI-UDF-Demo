public struct Session {
    public var token: String?
    public var session: String?
    
    mutating func reduce(_ action: Action) {
        if let action = action as? ReceiveToken {
            token = action.token
        } else if let action = action as? ReceiveSession {
            session = action.session
        } else if action is Logout {
            self = Session()
        }
    }
}
