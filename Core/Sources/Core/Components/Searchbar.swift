public struct Searchbar {
    public var query: String = ""
    public var request: UUID?
    
    public var results: [Movie.Id] = []
    public var currentPage: Int = 0
    public var totalPages: Int = 1
    
    
    public var canClearSearch: Bool {
        query.count > 0
    }
    
    public var canStartSearch: Bool {
        query.count > 2
    }
    
    public var nextPage: Int {
        currentPage + 1
    }
    
    public var hasNextPage: Bool {
        currentPage < totalPages
    }
    
    public var canRequestNextPage: Bool {
        canStartSearch && hasNextPage && request == nil
    }
    
    mutating func reduce(_ action: Action) {
        switch action {
        case let action as UpdateSearchQuery:
            self = Searchbar()
            query = action.query
            if canStartSearch { request = UUID() }
        case _ as ClearSearchQuery:
            self = Searchbar()
        case let action as ReceiveSearchPage:
            let page = action.moviesPage
            results += page.movies.map(\.id)
            currentPage = page.page
            totalPages = page.totalPages
        case _ as RequestNextSearchPage where canRequestNextPage:
            request = UUID()
        default:
            break
        }
    }
}
