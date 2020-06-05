import SwiftUI
import Core

struct MoviesList<MovieRow: View, Searchbar: View, MovieDetails: View>: View {
    let logout: Command
    let ids: [Movie.Id]
    let loadNextPage: Command?
    
    let row: (Movie.Id) -> MovieRow
    let searchbar: () -> Searchbar
    let movieDetails: (Movie.Id) -> MovieDetails
    
    var body: some View {
        NavigationView {
            List {
                searchbar()
                
                ForEach(ids, id:\.self) { id in
                    NavigationLink(
                        destination: self.movieDetails(id),
                        label: { self.row(id) }
                    )
                }
                
                if loadNextPage != nil {
                    Text("Loading...").onAppear(perform: loadNextPage)
                }
            }
            .navigationBarTitle("All movies")
            .navigationBarItems(trailing: Button(action: logout) {
                Text("Logout")
            })
        }
        
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList(
            logout: nop,
            ids: Array(1...3).map(Movie.Id.init),
            loadNextPage: nop,
            row: { id in MovieRow_Previews.initial },
            searchbar: { Searchbar_Previews.previews },
            movieDetails: { _ in MovieDetails_Previews.previews }
        )
    }
}

struct MoviesListConnector: Connector {
    
    func map(state: AppState, store: EnvironmentStore) -> some View {
        let moviesList = {
            MoviesList(
                logout: store.bind(.logout),
                ids: state.moviesList.ids,
                loadNextPage: state.moviesList.canRequestNextPage
                    ? store.bind(.requestNextMoviesPage)
                    : nil,
                row: { MovieRowConnector(id: $0) },
                searchbar: { SearchbarConnector() },
                movieDetails: { MovieDetailsConnector(id: $0) }
            )
        }
        
        let searchResults = {
            MoviesList(
                logout: store.bind(.logout),
                ids: state.searchResults.results,
                loadNextPage: state.searchResults.canRequestNextPage
                    ? store.bind(.requestNextSearchPage)
                    : nil,
                row: { MovieRowConnector(id: $0) },
                searchbar: { SearchbarConnector() },
                movieDetails: { MovieDetailsConnector(id: $0) }
            )
        }
        
        if state.searchResults.query.isEmpty {
            return moviesList()
        } else {
            return searchResults()
        }
    }
}
