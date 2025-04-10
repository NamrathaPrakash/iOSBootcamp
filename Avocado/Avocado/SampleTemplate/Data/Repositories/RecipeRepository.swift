//
//  RecipeRepository.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Combine
protocol RecipeRepository {
    func fetchRecipeData () -> AnyPublisher<[Recipe], Error>
}

class RecipeRepositoryImpl: RecipeRepository {
    private let apiService: ApiServiceProtocol
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    
    func fetchRecipeData() -> AnyPublisher<[Recipe], any Error> {
        apiService.request(_endpoint: RecipeEndPoint())
    }
    
}
