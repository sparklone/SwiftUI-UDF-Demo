public struct AllMovies {
    public var byId: [Movie.Id: Movie] = [:]
    
    mutating func reduce(_ action: Action) {
        if let action = action as? ReceiveSearchPage {
            for movie in action.moviesPage.movies {
                byId[movie.id] = movie
            }
        } else if let action = action as? ReceiveMoviesPage {
            for movie in action.moviePage.movies {
                byId[movie.id] = movie
            }
        }
    }
}
