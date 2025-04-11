//
//  FactRepository.swift
//  Avocado
//
//  Created by Suraj Kumar Gupta on 10/04/25.
//

import Combine
protocol FactRepository {
    func fetchFacts () -> AnyPublisher<[Fact], Error>
}

class FactRepositoryImpl: FactRepository {
    private let apiService: ApiServiceProtocol
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    
    func fetchFacts() -> AnyPublisher<[Fact], any Error> {
        apiService.request(_endpoint: FactsEndPoint())
    }
    
}
