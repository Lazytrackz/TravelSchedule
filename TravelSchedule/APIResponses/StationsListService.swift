//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 13.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias StationList = Components.Schemas.AllStationsResponse

//MARK: - StationListServiceProtocol

protocol StationListServiceProtocol {
    func getAllStations() async throws -> StationList
}

//MARK: - StationListService

final class StationListService: StationListServiceProtocol {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getAllStations() async throws -> StationList {
        let response = try await client.getAllStations(query: .init(apikey: apikey))
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        let limit = 50 * 1024 * 1024
        let fullData = try await Data(collecting: responseBody, upTo: limit)
        let allStations = try JSONDecoder().decode(StationList.self, from: fullData)
        return allStations
    }
}
