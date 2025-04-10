//
//  HeaderRepository.swift
//  Created by Suraj Kumar Gupta on 07/04/25.
//

import Combine
protocol HeaderRepository {
    func fetchHeader () -> AnyPublisher<[Header], Error>
}

class HeaderRepositoryImpl: HeaderRepository {
    private let apiService: ApiServiceProtocol
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    
    
    func fetchHeader() -> AnyPublisher<[Header], any Error> {
        apiService.request(_endpoint: HeaderEndPoint())
    }
    
}

