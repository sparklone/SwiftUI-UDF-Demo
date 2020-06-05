public struct MoviesList {
    public var ids: [Movie.Id] = []
    public var currentPage = 0
    public var totalPages = 1
    public var request: UUID? = UUID()
    
    public var hasMorePages: Bool {
        currentPage < totalPages
    }
    
    public var canRequestNextPage: Bool {
        hasMorePages && request == nil
    }
    
    public var nextPage: Int {
        currentPage + 1
    }
    
    mutating func reduce(_ action: Action) {

        if let action = action as? ReceiveMoviesPage {
            let page = action.moviePage
            request = nil
            ids += page.movies.map(\.id)
            currentPage = page.page
            totalPages = page.totalPages
        } else if action is RequestNextMoviesPage, request == nil {
            request = UUID()
        }
    }
}
