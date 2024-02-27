//
//  MovieClient.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 05.12.2023.
//

import Alamofire
import ComposableArchitecture
import UIKit

// MARK: - API client interface

// Typically this interface would live in its own module, separate from the live implementation.
// This allows the feature to compile faster since it only depends on the interface.



@DependencyClient
struct MovieClient {
    var fetchMovies: @Sendable (_ type: MovieEndpoint.List) async throws -> MovieResponse
}

extension DependencyValues {
    var movieCleint: MovieClient {
        get { self[MovieClient.self] }
        set { self[MovieClient.self] = newValue }
    }
}

// MARK: - Live API implementation

extension MovieClient: DependencyKey, TestDependencyKey {
    static let liveValue = MovieClient(
        fetchMovies: { type in
            let endpoint = "/movie/\(type.rawValue)"

            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(Self.apiKey)"
            ]

            return try await withCheckedThrowingContinuation { continuation in
                AF.request(baseUrl + endpoint,
                           method: .get,
                           headers: headers)
                    .validate()
                    .responseDecodable(of: MovieResponse.self, decoder: Utils.jsonDecoder) { response in
                        handleResponse(response, continuation)
                    }
            }
        }
    )
}

// MARK: - Test Implementation

extension MovieClient {
    static let testValue = MovieClient(
        fetchMovies: { _ in
            return MovieResponse(results: Movie.mockMovies)
        }
    )
}

private func handleResponse<T>(_ response: AFDataResponse<T>, _ continuation: CheckedContinuation<T, Error>) {
    switch response.result {
    case let .success(value):
        continuation.resume(returning: value)
    case let .failure(error):
        continuation.resume(throwing: error)
    }
}
