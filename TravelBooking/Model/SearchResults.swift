//
//  SearchResults.swift
//  TravelBooking
//
//  Created by Janarthanan Kannan on 3/13/21.
//

import Foundation

// MARK: - Results
struct Results: Codable {
    var resultsId: String = ""
    var isLcc: Bool = false
    var airlineRemark:String = ""
    var journeyType: Int = 0
    var origin: String = ""
    var destination: String = ""
    var fare: Fares
    var IsRefundAllowed: Bool = false
    var faresBreakdown: [FaresBreakdown]
    var segments: [Segments]
}

// MARK: - Fares
struct Fares: Codable {
    var totalFare: Double = 0.0
    var agentMarkup, otherCharges: Int
    var serviceFee: Int = 0
    var baseFare, tax: Double
    var penaltyAmount: Int = 0
}


// MARK: - FareBreakdown
struct FaresBreakdown: Codable {
    var currency: String
    var passengerType, passengerCount: Int
    var totalFare: Double
    var otherCharges, agentMarkup, serviceFee: Int
    var baseFare, tax: Double
    var penaltyAmount, baseROE: Int
}

// MARK: - Segment
struct Segments: Codable {
    var noOfSeatAvailable: Int
    var segmentIndicator: Int
    var airline: String
    var origin, destination: DestinationClass
    var flightNumber, departureTime, arrivalTime: String
    var bookingClass: String
    var flightStatus: Int
    var eTicketEligible: Bool
    var craft: String
    var stopOver: Bool
    var stops, mile: Int
    var duration, groundTime, accumulatedDuration: String
    var stopPointArrivalTime, stopPointDepartureTime: String
    var includedBaggage: String
    var cabinBaggage: String
    var cabinClass: String
    var airlineName: String

}


// MARK: - DestinationClass
struct DestinationClass: Codable {
    var airportCode: String
    var airportName: String
    var cityCode: String
    var cityName: String
    var countryCode: String
    var countryName: String
    var terminal: String

    enum CodingKeys: String, CodingKey {
        case airportCode
        case airportName
        case cityCode
        case cityName
        case countryCode
        case countryName
        case terminal
    }
}
