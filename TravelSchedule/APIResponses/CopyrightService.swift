//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 11.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyrights = Components.Schemas.Copyrights


//MARK: - CopyrightServiceProtocol

protocol CopyrightServiceProtocol {
    func getCopyright() async throws -> Copyrights
}

//MARK: - CopyrightService

final class CopyrightService: CopyrightServiceProtocol {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getCopyright() async throws -> Copyrights {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
