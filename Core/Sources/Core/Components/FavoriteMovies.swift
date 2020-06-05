import Foundation

public struct FavoriteMovies {
    public var favorites: Set<Movie.Id> = []
    
    
    mutating func reduce(_ action: Action) {
        switch action {
        case let action as AddToFavorite:
            favorites.insert(action.id)
        case let action as RemoveFromFavorites:
            favorites.remove(action.id)
        default:
            break
        }
    }
}
