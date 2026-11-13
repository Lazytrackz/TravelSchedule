//
//  NearestSettlementService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 12.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestSettlement = Components.Schemas.NearestCityResponse

//MARK: - NearestSettlementServiceProtocol

protocol NearestSettlementServiceProtocol {
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestSettlement
}

//MARK: - NearestSettlementService

final class NearestSettlementService: NearestSettlementServiceProtocol  {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestSettlement {
        let response = try await client.getNearestCity(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
}
