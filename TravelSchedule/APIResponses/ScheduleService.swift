//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 12.11.2026.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Schedule = Components.Schemas.ScheduleResponse

//MARK: - ScheduleServiceProtocol

protocol ScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> Schedule
}

//MARK: - ScheduleService

final class ScheduleService: ScheduleServiceProtocol {
    
    //MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    //MARK: - Init
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    //MARK: - Methods
    
    func getStationSchedule(station: String) async throws -> Schedule {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station
        ))
        return try response.ok.body.json
    }
}
