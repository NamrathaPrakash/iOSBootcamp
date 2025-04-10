//
//  FetchRecipeUseCase.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation
import Combine
protocol FetchRecipeUseCase {
    func execute() -> AnyPublisher<[Recipe], Error>
}

class FetchRecipeUseCaseImpl: FetchRecipeUseCase {
    private let repository: RecipeRepository
    init(repository: RecipeRepository) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[Recipe], any Error> {
        return repository.fetchRecipeData()
    }
}
