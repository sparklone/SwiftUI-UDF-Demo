public struct LoginForm {
    public var username: String = ""
    public var password: String = ""
    
    public var isCredentialsOk: Bool {
        username.count > 2 && password.count > 2
    }
    
    mutating func reduce(_ action: Action) {
        if let action = action as? UpdateUsername {
            username = action.username
        } else if let action = action as? UpdatePassword {
            password = action.password
        } else if let _ = action as? Logout {
            self = LoginForm()
        }
    }
}
