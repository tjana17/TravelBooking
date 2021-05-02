//
//  ResultsCell.swift
//  TravelBooking
//
//  Created by Janarthanan Kannan on 3/13/21.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    @IBOutlet weak var orginLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var returnOrginLbl: UILabel!
    @IBOutlet weak var returnDestinationLbl: UILabel!
    @IBOutlet weak var estimatedTimeLbl: UILabel!
    @IBOutlet weak var returnEstimatedTimeLbl: UILabel!
    @IBOutlet weak var departureTimeLbl: UILabel!
    @IBOutlet weak var arrivalTimeLbl: UILabel!
    @IBOutlet weak var returnDepartureTimeLbl: UILabel!
    @IBOutlet weak var returnArrivalTimeLbl: UILabel!
    @IBOutlet weak var flightDetailsLbl: UILabel!
    @IBOutlet weak var returnFlightDetailsLbl: UILabel!
    @IBOutlet weak var refundStatusLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var originLogo: UIImageView!
    @IBOutlet weak var destinationLogo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
