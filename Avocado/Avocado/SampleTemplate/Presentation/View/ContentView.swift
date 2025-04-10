//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//  iOS 16

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
    @StateObject private var viewModel: ContentViewModel
    init(viewModel: ContentViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // MARK: - HEADER
          if viewModel.isLoading {
              ProgressView("Loading Headers....")
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
          }
          else if let errorMessage = viewModel.errorMsgHeader {
              VStack(spacing: 16) {
                  Text(errorMessage)
              }
          }
          else if viewModel.headers.count > 0 {
                  ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(viewModel.headers) { item in
                        HeaderView(header: item)
                      }
                    }
                  }
              }

        
        // MARK: - DISHES
        
        Text("Avocado Dishes")
          .fontWeight(.bold)
          .modifier(TitleModifier())
        
        DishesView()
          .frame(maxWidth: 640)
        
        // MARK: - AVOCADO FACTS
        
        Text("Avocado Facts")
          .fontWeight(.bold)
          .modifier(TitleModifier())
          if viewModel.isLoading {
              ProgressView("Loading Facts....")
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
          }
          else if let errorMessage = viewModel.errorMsgFact {
              VStack(spacing: 16) {
                  Text(errorMessage)
              }
          }
          else if viewModel.facts.count > 0 {
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: .top, spacing: 60) {
                      ForEach(viewModel.facts) { item in
                          FactsView(fact: item)
                      }
                  }
                  .padding(.vertical)
                  .padding(.leading, 60)
                  .padding(.trailing, 20)
              }
        }
        
        // MARK: - RECIPE CARDS
        
        Text("Avocado Recipes")
          .fontWeight(.bold)
          .modifier(TitleModifier())
          if viewModel.isLoading {
              ProgressView("Loading Facts....")
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
          }
          else if let errorMessage = viewModel.errorMsgRecipe {
              VStack(spacing: 16) {
                  Text(errorMessage)
              }
          }
          else if viewModel.recipes.count > 0 {
              VStack(alignment: .center, spacing: 20) {
                  ForEach(viewModel.recipes) { item in
                      RecipeCardView(recipe: item)
                  }
              }
              .frame(maxWidth: 640)
              .padding(.horizontal)
           }
        
        
        // MARK: - FOOTER
        
        VStack(alignment: .center, spacing: 20) {
          Text("All About Avocados")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          Text("Everything you wanted to know about avocados but were too afraid to ask.")
            .font(.system(.body, design: .serif))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.gray)
            .frame(minHeight: 60)
        }
        .frame(maxWidth: 640)
        .padding()
        .padding(.bottom, 85)
      }
    }
    .edgesIgnoringSafeArea(.all)
    .padding(0)
    .onAppear{
            viewModel.fetchHeader()
            viewModel.fetchFact()
            viewModel.fetchRecipe()
        }
  }
    
}

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .serif))
      .foregroundColor(Color("ColorGreenAdaptive"))
      .padding(8)
  }
}

//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//      .previewDevice("iPhone 13")
//  }
//}
