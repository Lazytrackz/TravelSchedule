//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 12.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Search = Components.Schemas.Segments

//MARK: - SearchServiceProtocol

protocol SearchServiceProtocol {
    func getScheduleBetweenStations(from: String, to: String) async throws -> Search
}

//MARK: - SearchService

final class SearchService: SearchServiceProtocol {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getScheduleBetweenStations(from: String, to: String) async throws -> Search {
        let response = try await client.getScheduleBetweenStations(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
}
