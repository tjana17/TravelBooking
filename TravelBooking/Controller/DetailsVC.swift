//
//  DetailsVC.swift
//  TravelBooking
//
//  Created by Janarthanan Kannan on 3/13/21.
//

import UIKit

class DetailsVC: UIViewController {

    // MARK: - Init -
    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var originAirportLbl: UILabel!
    @IBOutlet weak var destinationAirportLbl: UILabel!
    @IBOutlet weak var originTerminalLbl: UILabel!
    @IBOutlet weak var destinationTerminalLbl: UILabel!
    @IBOutlet weak var departureTimeLbl: UILabel!
    @IBOutlet weak var arrivalTimeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookingButton: UIButton!
    
    @IBOutlet weak var basePriceLbl: UILabel!
    @IBOutlet weak var taxPriceLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    var detailsArray = [Results]()
    
    
    // MARK: - Main
   
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        bookingButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.01, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.bookingButton.center.y += 200
            self.bookingButton.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0.03, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.bookingButton.isHidden = false
                self.bookingButton.center.y -= 200
                self.bookingButton.alpha = 1
            }, completion: { _ in
                self.animateImage()
            })
            
        })
    }
    func animateImage() {
        UIView.animate(withDuration: 2.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.imageView.transform = CGAffineTransform(translationX: 10, y: -30)
        }, completion: { _ in})
    }
    
    
    fileprivate func updateUI() {
        self.originLbl.text = detailsArray[0].segments[0].origin.airportCode
        self.destinationLbl.text = detailsArray[0].segments[0].destination.airportCode
        self.durationLbl.text = detailsArray[0].segments[0].duration
        self.originAirportLbl.text = detailsArray[0].segments[0].origin.airportName
        self.destinationAirportLbl.text = detailsArray[0].segments[0].destination.airportName
        self.originTerminalLbl.text = String(format: "Terminal : %@", detailsArray[0].segments[0].origin.terminal)
        self.destinationTerminalLbl.text = String(format: "Terminal : %@", detailsArray[0].segments[0].destination.terminal)
        self.departureTimeLbl.text = detailsArray[0].segments[0].departureTime
        self.arrivalTimeLbl.text = detailsArray[0].segments[0].arrivalTime
        
        self.basePriceLbl.text = String(format: "USD %.2f", detailsArray[0].faresBreakdown[0].baseFare)
        self.taxPriceLbl.text = String(format: "USD %.2f", detailsArray[0].faresBreakdown[0].totalFare - detailsArray[0].faresBreakdown[0].baseFare)
        self.totalPriceLbl.text = String(format: "USD %.2f", detailsArray[0].faresBreakdown[0].totalFare)
    }
    

   

}
