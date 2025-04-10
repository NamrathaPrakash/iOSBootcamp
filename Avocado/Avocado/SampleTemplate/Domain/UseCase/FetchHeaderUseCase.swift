//
//  FetchHeaderUseCase.swift
//  ApiCalllCleanArchitect
//
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Foundation
import Combine
protocol FetchHeaderUseCase {
    func execute() -> AnyPublisher<[Header], Error>
}

class FetchHeaderUseCaseImpl: FetchHeaderUseCase {
    private let repository: HeaderRepository
    init(repository: HeaderRepository) {
        self.repository = repository
    }
    func execute() -> AnyPublisher<[Header], any Error> {
        return repository.fetchHeader()
    }
}
