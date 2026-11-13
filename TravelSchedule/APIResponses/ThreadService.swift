//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 12.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Thread = Components.Schemas.ThreadStationsResponse

//MARK: - ThreadServiceProtocol

protocol ThreadServiceProtocol {
    func getRouteStations(uid: String) async throws -> Thread
}

//MARK: - ThreadService

final class ThreadService: ThreadServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getRouteStations(uid: String) async throws -> Thread {
        let response = try await client.getRouteStations(query: .init(
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
}
