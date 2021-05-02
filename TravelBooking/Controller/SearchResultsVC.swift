//
//  SearchResultsVC.swift
//  TravelBooking
//
//  Created by Janarthanan Kannan on 3/13/21.
//

import UIKit
import SwiftyJSON

class SearchResultsVC: UIViewController {

    let cellIdentifier: String = "listCell"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cardView:UIView!
    var jsonData: JSON = []
    var totalResultsCount: Int = 0
    var resultArray: [Results] = [Results]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorColor = UIColor.clear
        self.tableView.backgroundColor = UIColor.systemGroupedBackground
        self.cardView.isHidden =  true
        self.tableView.isHidden = true
        if let path : String = Bundle.main.path(forResource: "SearchList", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                jsonData = JSON(data)
                addDataToModel()
                
            }
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.01, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.cardView.center.y += 200
            self.cardView.alpha = 0.5
            self.tableView.center.y += 200
            self.tableView.alpha = 0.5
            
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0.03, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.cardView.isHidden = false
                self.cardView.center.y -= 200
                self.cardView.alpha = 1
                self.tableView.isHidden = false
                self.tableView.center.y -= 200
                self.tableView.alpha = 1
            })
//            self.animateImage()
        })
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.cardView.isHidden =  true
        self.tableView.isHidden = true
    }
    
    fileprivate func fareBreakDownFunc(_ fareBD: JSON, _ fareBreakdown: inout [FaresBreakdown]) {
        var fbd: [FaresBreakdown] {
            return [FaresBreakdown.init(
                        currency: fareBD["Currency"].stringValue,
                        passengerType: fareBD["PassengerType"].intValue,
                        passengerCount: fareBD["PassengerCount"].intValue,
                        totalFare: fareBD["TotalFare"].doubleValue,
                        otherCharges: fareBD["OtherCharges"].intValue,
                        agentMarkup: fareBD["AgentMarkup"].intValue,
                        serviceFee: fareBD["ServiceFee"].intValue,
                        baseFare: fareBD["BaseFare"].doubleValue,
                        tax: fareBD["Tax"].doubleValue,
                        penaltyAmount: fareBD["PenaltyAmount"].intValue,
                        baseROE: fareBD["BaseROE"].intValue)]
        }
        fareBreakdown.append(contentsOf: fbd)
    }
    
    fileprivate func segmentsFunc(_ emptySegment: JSON, _ segment: inout [Segments]) {
        var orgin: DestinationClass {
            return DestinationClass.init(airportCode: emptySegment["Origin"]["AirportCode"].stringValue, airportName: emptySegment["Origin"]["AirportName"].stringValue, cityCode: emptySegment["Origin"]["CityCode"].stringValue, cityName: emptySegment["Origin"]["CityName"].stringValue, countryCode: emptySegment["Origin"]["CountryCode"].stringValue, countryName: emptySegment["Origin"]["CountryName"].stringValue, terminal: emptySegment["Origin"]["Terminal"].stringValue)
        }
        var destination: DestinationClass {
            return DestinationClass.init(airportCode: emptySegment["Destination"]["AirportCode"].stringValue, airportName: emptySegment["Destination"]["AirportName"].stringValue, cityCode: emptySegment["Destination"]["CityCode"].stringValue, cityName: emptySegment["Destination"]["CityName"].stringValue, countryCode: emptySegment["Destination"]["CountryCode"].stringValue, countryName: emptySegment["Destination"]["CountryName"].stringValue, terminal: emptySegment["Destination"]["Terminal"].stringValue)
        }
        let duration = durationHours(value: emptySegment["Duration"].stringValue)
        let departureTime = timeFunc(value: emptySegment["DepartureTime"].stringValue)
        let arrivalTime = timeFunc(value: emptySegment["ArrivalTime"].stringValue)
        var segments: [Segments] {
            return [Segments.init(noOfSeatAvailable: emptySegment["NoOfSeatAvailable"].intValue,  segmentIndicator: emptySegment["SegmentIndicator"].intValue, airline: emptySegment["Airline"].stringValue, origin: orgin, destination: destination, flightNumber: emptySegment["FlightNumber"].stringValue, departureTime: departureTime, arrivalTime: arrivalTime, bookingClass: emptySegment["BookingClass"].stringValue, flightStatus: emptySegment["FlightStatus"].intValue, eTicketEligible: emptySegment["ETicketEligible"].boolValue, craft: emptySegment["Craft"].stringValue, stopOver: emptySegment["StopOver"].boolValue, stops: emptySegment["Stops"].intValue, mile: emptySegment["Mile"].intValue, duration: duration, groundTime: emptySegment["GroundTime"].stringValue, accumulatedDuration: emptySegment["AccumulatedDuration"].stringValue, stopPointArrivalTime: emptySegment["StopPointArrivalTime"].stringValue, stopPointDepartureTime: emptySegment["StopPointDepartureTime"].stringValue, includedBaggage: emptySegment["IncludedBaggage"].stringValue, cabinBaggage: emptySegment["CabinBaggage"].stringValue, cabinClass: emptySegment["CabinClass"].stringValue,  airlineName: emptySegment["AirlineName"].stringValue)]
        }
        segment.append(contentsOf: segments)
    }
    
    // MARK: -
    fileprivate func addDataToModel() {
        for (_, data) in jsonData["Results"] {
            
            totalResultsCount = data.count
            for (_, emptyData) in data[] {
                // Fares
                var fares: Fares {
                    return Fares.init(totalFare: emptyData["Fare"]["TotalFare"].doubleValue, agentMarkup: emptyData["Fare"]["AgentMarkup"].intValue,
                                      otherCharges: emptyData["Fare"]["OtherCharges"].intValue,
                                      serviceFee: emptyData["Fare"]["ServiceFee"].intValue,
                                      baseFare: emptyData["Fare"]["BaseFare"].doubleValue,
                                      tax: emptyData["Fare"]["Tax"].doubleValue,
                                      penaltyAmount: emptyData["Fare"]["PenaltyAmount"].intValue)
                }
                
                // FareBreakDown
                var fareBreakdown:  [FaresBreakdown] = [FaresBreakdown]()
                for(_, fareBD) in emptyData["FareBreakdown"] {
                    fareBreakDownFunc(fareBD, &fareBreakdown)
                }
                // Segments
                var segment = [Segments]()
                for (_, segmnt) in emptyData["Segments"] {
                    for(_, emptySegment) in segmnt[] {
                        segmentsFunc(emptySegment, &segment)
                    }
                }
                
                var results: Results {
                    return Results.init(resultsId: emptyData["ResultId"].stringValue, isLcc:  emptyData["IsLcc"].boolValue, airlineRemark: emptyData["AirlineRemark"].stringValue, journeyType: emptyData["JourneyType"].intValue, origin: emptyData["Origin"].stringValue, destination: emptyData["Destination"].stringValue, fare: fares, IsRefundAllowed: emptyData["IsRefundAllowed"].boolValue, faresBreakdown: fareBreakdown, segments: segment)
                }
                
                resultArray.append(results)
                
                self.tableView.reloadData()
            }
        }
    }
    
    func durationHours(value: String) -> String {
        let splitString = value.components(separatedBy: ":")
        let duration = "\(splitString[0])h, \(splitString[1])m"
        return duration
    }
    func timeFunc(value: String) -> String {
        let splitDate = value.components(separatedBy: "T")
        let splitTime = splitDate[1].components(separatedBy: ":")
        let timeStr = "\(splitTime[0]):\(splitTime[1])"
        return timeStr
    }

}


// MARK: - UITableView Delegate & DataSource

extension SearchResultsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalResultsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ResultsCell
        
        cell.flightDetailsLbl.text = resultArray[indexPath.row].segments[0].airlineName + " " + resultArray[indexPath.row].segments[0].airline + " | " + resultArray[indexPath.row].segments[0].flightNumber
        cell.returnFlightDetailsLbl.text = resultArray[indexPath.row].segments[1].airlineName + " " + resultArray[indexPath.row].segments[1].airline + " | " + resultArray[indexPath.row].segments[1].flightNumber
        cell.priceLbl.text = String(format:"USD %.2f", resultArray[indexPath.row].fare.totalFare)
        cell.orginLbl.text = resultArray[indexPath.row].segments[0].origin.airportCode
        cell.destinationLbl.text = resultArray[indexPath.row].segments[0].destination.airportCode
        cell.returnOrginLbl.text = resultArray[indexPath.row].segments[1].origin.airportCode
        cell.returnDestinationLbl.text = resultArray[indexPath.row].segments[1].destination.airportCode
        
        cell.refundStatusLbl.text = String(resultArray[indexPath.row].IsRefundAllowed ? "Refundable" : "Non-refundable")
        cell.departureTimeLbl.text = String(resultArray[indexPath.row].segments[0].departureTime)
        cell.arrivalTimeLbl.text = String(resultArray[indexPath.row].segments[0].arrivalTime)
        cell.returnDepartureTimeLbl.text = String(resultArray[indexPath.row].segments[1].departureTime)
        cell.returnArrivalTimeLbl.text = String(resultArray[indexPath.row].segments[1].arrivalTime)
        cell.estimatedTimeLbl.text = String(resultArray[indexPath.row].segments[0].duration)
        cell.returnEstimatedTimeLbl.text = String(resultArray[indexPath.row].segments[1].duration)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = Constants.storyboardName?.instantiateViewController(withIdentifier: Constants.detailsVC) as! DetailsVC
        vc.detailsArray = [resultArray[indexPath.row]]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
