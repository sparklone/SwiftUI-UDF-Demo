import Foundation

public struct HighResolutionImages {
    public var ids: Set<Movie.Id> = []
    
    mutating func reduce(_ action: Action) {
        switch action {
        case let action as DisplayMovieDetails:
            ids.insert(action.id)
        default:
            break
        }
    }
}
