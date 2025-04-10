//
//  ContentViewModel.swift
//  Avocados
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var headers: [Header] = []
    @Published var facts: [Fact] = []
    @Published var recipes: [Recipe] = []
    @Published var errorMsgHeader: String?
    @Published var errorMsgFact: String?
    @Published var errorMsgRecipe: String?
    @Published var isLoading:Bool = false
    private var cancellables = Set<AnyCancellable>()
    private let fetchHeaderUseCase: FetchHeaderUseCaseImpl
    private let fetchFactsUseCase: FetchFactUseCaseImpl
    private let fetchRecipeUseCase: FetchRecipeUseCaseImpl
    
    init(fetchHeaderUseCase: FetchHeaderUseCaseImpl, fetchFactsUseCase: FetchFactUseCaseImpl, fetchRecipeUseCase: FetchRecipeUseCaseImpl) {
        self.fetchHeaderUseCase = fetchHeaderUseCase
        self.fetchFactsUseCase = fetchFactsUseCase
        self.fetchRecipeUseCase = fetchRecipeUseCase
    }
    
    func fetchHeader() {
        errorMsgHeader = nil
        fetchHeaderUseCase.execute()
            .sink(receiveCompletion: {[weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.errorMsgHeader = error.localizedDescription
                }
            },
                  receiveValue: {[weak self] headers in
                self?.headers = headers
            })
            .store(in : &cancellables)

    }
    
    func fetchFact() {
        errorMsgFact = nil
        fetchFactsUseCase.execute()
            .sink(receiveCompletion: {[weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.errorMsgFact = error.localizedDescription
                }
            },
                  receiveValue: {[weak self] facts in
                self?.facts = facts
            })
            .store(in : &cancellables)

    }
    
    func fetchRecipe() {
        errorMsgRecipe = nil
        fetchRecipeUseCase.execute()
            .sink(receiveCompletion: {[weak self] completion in
                guard let self = self else { return }
                if case let .failure(error) = completion {
                    self.errorMsgRecipe = error.localizedDescription
                }
            },
                  receiveValue: {[weak self] recipes in
                self?.recipes = recipes
            })
            .store(in : &cancellables)

    }
}
