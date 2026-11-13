//
//  NearestStationsService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 09.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations

//MARK: - NearestStationsServiceProtocol

protocol NearestStationsServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
}

//MARK: - NearestStationsService

final class NearestStationsService: NearestStationsServiceProtocol {
    
    //MARK: - Private methods
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
}
