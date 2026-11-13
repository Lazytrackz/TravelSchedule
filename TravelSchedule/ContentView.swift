//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Aleksey Kosichenko on 09.11.2026.
//

import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession

//MARK: - ContentView

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            testFetchStations()
            testFetchCopyright()
            testFetchSearch()
            testFetchSchedule()
            testFetchThread()
            testFetchSettlements()
            testFetchCarrier()
            testFetchStationList()
        }
    }
    
    //MARK: - Methods
    
    func testFetchStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = NearestStationsService(
                    client: client,
                    apikey: APIConstants.apikey
                )
                
                print("Fetching stations...")
                let stations = try await service.getNearestStations(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 50
                )
                print("Successfully fetched stations: \(stations)")
            } catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
    
    func testFetchCopyright() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = CopyrightService(
                    client: client,
                    apikey: APIConstants.apikey
                )
                
                print("Fetching copyright...")
                let copyright = try await service.getCopyright()
                
                print("Successfully fetched copyright: \(copyright)")
            } catch {
                
                print("Error fetching stations: \(error)")
            }
        }
    }
    
    func testFetchSearch() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = SearchService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                
                print("Fetching search...")
                let search = try await service.getScheduleBetweenStations(
                    from: "c146",
                    to: "c213"
                )
                
                print("Successfully fetched search: \(search)")
            } catch {
                print("Error fetching search: \(error)")
            }
        }
    }
    
    func testFetchSchedule() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                let service = ScheduleService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                print("Fetching schedule...")
                let schedule = try await service.getStationSchedule(station: "s9600213")
                print("Successfully fetched schedule: \(schedule)")
                
            } catch {
                print("Error fetching schedule: \(error)")
            }
        }
    }
    
    func testFetchThread() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                let service = ThreadService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                print("Fetching thread...")
                let thread = try await service.getRouteStations(uid: "092S_13_2")
                print("Successfully fetched thread: \(thread)")
            } catch {
                print("Error fetching schedule: \(error)")
            }
        }
    }
    
    func testFetchSettlements() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                let service = NearestSettlementService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                print("Fetching settlements...")
                let settlements = try await service.getNearestCity(
                    lat: 59.864177,
                    lng: 30.319163,
                )
                print("Successfully fetched settlements: \(settlements)")
            } catch {
                print("Error fetching settlements: \(error)")
            }
        }
    }
    
    func testFetchCarrier() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                let service = CarrierService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                print("Fetching carrier...")
                let carrier = try await service.getCarrierInfo(code: "680")
                print("Successfully fetched carrier: \(carrier)")
                
            } catch {
                print("Error fetching carrier: \(error)")
            }
        }
    }
    
    func testFetchStationList() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = StationListService(
                    client: client,
                    apikey: "d945c445-93b5-4f95-b47d-8a8f9a89a937"
                )
                
                print("Fetching station list...")
                let stationList = try await service.getAllStations()
                
                print("Successfully fetched station list: \(stationList)")
            } catch {
                
                print("Error fetching station list: \(error)")
            }
        }
    }
    
    
}

//MARK: - Preview

#Preview {
    ContentView()
}
