//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 12.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Carrier = Components.Schemas.CarrierResponse

//MARK: - CarrierServiceProtocol

protocol CarrierServiceProtocol {
    func getCarrierInfo(code: String) async throws -> Carrier
}

//MARK: - CarrierService

final class CarrierService: CarrierServiceProtocol {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getCarrierInfo(code: String) async throws -> Carrier {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code,
        ))
        return try response.ok.body.json
    }
}
