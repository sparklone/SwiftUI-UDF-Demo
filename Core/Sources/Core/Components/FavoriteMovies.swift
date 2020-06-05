import Foundation

public struct FavoriteMovies {
    public var favorites: Set<Movie.Id> = []
    
    
    mutating func reduce(_ action: Action) {
        if let action = action as? AddToFavorite {
            favorites.insert(action.id)
        } else if let action = action as? RemoveFromFavorites {
            favorites.remove(action.id)
        }
    }
}
