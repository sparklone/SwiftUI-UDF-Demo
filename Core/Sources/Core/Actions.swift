import Foundation

public protocol Action {}

public struct UpdateUsername: Action {
    public init(username: String) {
        self.username = username
    }
    let username: String
}
public struct UpdatePassword: Action {
    let password: String
    public init(password: String) {
        self.password = password
    }
}

public struct ActionLogin: Action {
    public init() {}
}

public struct Logout: Action {
    public init() {}
}

public struct ReceiveToken: Action {
    let token: String
    public init(token: String) {
        self.token = token
    }
}

public struct TokenRequestFailed: Action {
    public init() {}
}

public struct TokenValidated: Action {
    public init() {}
}

public struct InvalidCredentials: Action {
    public init() {}
}

public struct TokenValidationFailed: Action {
    public init() {}
}

public struct ReceiveSession: Action {
    let session: String
    public init(session: String) {
        self.session = session
    }
}

public struct SessionRequestFailed: Action {
    public init() {}
}

public struct ReceiveMoviesPage: Action {
    let moviePage: MoviesPage
    public init(moviePage: MoviesPage) {
        self.moviePage = moviePage
    }
}

public struct RequestNextMoviesPage: Action {
    public init() {}
}

public struct UpdateSearchQuery: Action {
    let query: String
    public init(query: String) {
        self.query = query
    }
}

public struct ClearSearchQuery: Action {
    public init() {}
}

public struct ReceiveSearchPage: Action {
    let moviesPage: MoviesPage
    public init(moviePage: MoviesPage) {
        self.moviesPage = moviePage
    }
}

public struct SearchRequestWasCancelled: Action {
    public init() {}
}
public struct RequestNextSearchPage: Action {
    public init() {}
}

public struct DidLoadPoster: Action {
    let id: Movie.Id
    public init(id: Movie.Id) {
        self.id = id
    }
    
}

public struct AddToFavorite: Action {
    let id: Movie.Id
    public init(id: Movie.Id) {
        self.id = id
    }
    
}

public struct RemoveFromFavorites: Action {
    let id: Movie.Id
    public init(id: Movie.Id) {
        self.id = id
    }
}

public struct DisplayMovieDetails: Action {
    let id: Movie.Id
    public init(id: Movie.Id) {
        self.id = id
    }
}
