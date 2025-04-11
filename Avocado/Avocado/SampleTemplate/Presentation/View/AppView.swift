
import SwiftUI

struct AppView: View {
  var body: some View {
      let apiService = APIService()
      let repositriesHeader = HeaderRepositoryImpl(apiService: apiService)
      let useCaseHeader = FetchHeaderUseCaseImpl(repository: repositriesHeader)
      
      let repositriesFact = FactRepositoryImpl(apiService: apiService)
      let useCaseFact = FetchFactUseCaseImpl(repository: repositriesFact)
      
      let repositriesRecipe = RecipeRepositoryImpl(apiService: apiService)
      let useCaseRecipe = FetchRecipeUseCaseImpl(repository: repositriesRecipe)
      
      let viewModel = ContentViewModel(fetchHeaderUseCase: useCaseHeader, fetchFactsUseCase: useCaseFact, fetchRecipeUseCase: useCaseRecipe)
        
      
    TabView {
      AvocadosView()
        .tabItem({
          Image("tabicon-branch")
          Text("Avocados")
        })
        ContentView(viewModel: viewModel)
        .tabItem({
          Image("tabicon-book")
          Text("Recipes")
        })
    }
    .accentColor(Color.primary)
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
      .previewDevice("iPhone 13")
      .environment(\.colorScheme, .dark)
  }
}
