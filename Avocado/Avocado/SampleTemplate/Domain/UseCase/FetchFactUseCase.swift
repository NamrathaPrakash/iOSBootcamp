//
//  FetchFactUseCase.swift
//  Avocados
//  Created by Suraj Kumar Gupta on 07/04/25.

import Foundation
import Combine
protocol FetchFactUseCase {
    func execute() -> AnyPublisher<[Fact], Error>
}

class FetchFactUseCaseImpl: FetchFactUseCase {
    private let repository: FactRepository
    init(repository: FactRepository) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[Fact], any Error> {
        return repository.fetchFacts()
    }
}
