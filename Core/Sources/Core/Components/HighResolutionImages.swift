import Foundation

public struct HighResolutionImages {
    public var ids: Set<Movie.Id> = []
    
    mutating func reduce(_ action: Action) {
        if let action = action as? DisplayMovieDetails {
            ids.insert(action.id)
        }
    }
}
