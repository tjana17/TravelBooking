//
//  ViewController.swift
//  TravelBooking
//
//  Created by Janarthanan Kannan on 3/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var passengerLbl: UILabel!
    @IBOutlet weak var hiLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var flightView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var flightLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        hiLbl.isHidden = true
        welcomeLbl.isHidden = true
        nameLbl.isHidden = true
        profileImg.isHidden = true
        flightView.isHidden = true
        dateView.isHidden = true
        submitBtn.isHidden = true
        flightLbl.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.01, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.hiLbl.transform = CGAffineTransform(translationX: -100, y: 0)
            self.hiLbl.alpha = 0.5
            self.nameLbl.transform = CGAffineTransform(translationX: -100, y: 0)
            self.nameLbl.alpha = 0.5
            self.welcomeLbl.transform = CGAffineTransform(translationX: -100, y: 0)
            self.welcomeLbl.alpha = 0.5
            self.profileImg.transform = CGAffineTransform(translationX: 1000, y: 0)
            self.profileImg.alpha = 0.5
            self.flightLbl.transform = CGAffineTransform(translationX: -100, y: 0)
            self.flightLbl.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 1.5, delay: 0.03, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.hiLbl.isHidden = false
                self.hiLbl.transform = .identity
                self.hiLbl.alpha = 1
                self.nameLbl.isHidden = false
                self.nameLbl.transform = .identity
                self.nameLbl.alpha = 1
                self.welcomeLbl.isHidden = false
                self.welcomeLbl.transform = .identity
                self.welcomeLbl.alpha = 1
                self.profileImg.isHidden = false
                self.profileImg.transform = .identity
                self.profileImg.alpha = 1
                
                self.flightLbl.isHidden = false
                self.flightLbl.transform = .identity
                self.flightLbl.alpha = 1
                
            }, completion: { _ in
                self.animateViews()
            })
            
        })
    }
    func animateViews() {
        UIView.animate(withDuration: 0.01, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            self.flightView.center.y += 200
            self.flightView.alpha = 0.5
            self.dateView.center.y += 200
            self.dateView.alpha = 0.5
            self.submitBtn.center.y += 200
            self.submitBtn.alpha = 0.5
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0.03, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.flightView.isHidden = false
                self.flightView.center.y -= 200
                self.flightView.alpha = 1
                self.dateView.isHidden = false
                self.dateView.center.y -= 200
                self.dateView.alpha = 1
                self.submitBtn.isHidden = false
                self.submitBtn.center.y -= 200
                self.submitBtn.alpha = 1
            }, completion: { _ in })
            
        })
    }
    func updateUI() {
        
        
        originLbl.addLeading(image: UIImage(named: "location") ?? UIImage(), text: " Doha")
        destinationLbl.addLeading(image: UIImage(named: "location") ?? UIImage(), text: " Mumbai")
        dateLabel.addLeading(image: UIImage(systemName: "calendar") ?? UIImage(), text: " July 1st, 2021 Thursday")
        passengerLbl.addLeading(image: UIImage(systemName: "person.crop.circle.fill") ?? UIImage(), text: " 1 Passenger, Economy")
    }
    override func viewDidDisappear(_ animated: Bool) {
        hiLbl.isHidden = true
        welcomeLbl.isHidden = true
        nameLbl.isHidden = true
        profileImg.isHidden = true
        flightView.isHidden = true
        dateView.isHidden = true
        submitBtn.isHidden = true
        flightLbl.isHidden = true
    }

}


