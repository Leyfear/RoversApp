//
//  DetailPopUpViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit
import Kingfisher

class DetailPopUpViewController: UIViewController {
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet weak var landingLabel: UILabel!
    @IBOutlet weak var launchingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var vehicleNameLabel: UILabel!
    @IBOutlet weak var capturedDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var detail: Photos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isOpaque = true
        if let imageURL = detail?.imgSrc{
            if let url = URL(string: imageURL){
                imageView.kf.setImage(with: url)
            }
        } else {
            self.imageView.image = nil
        }
        landingLabel.text = "Landing Date: \(detail?.rover?.landingDate ?? "")"
        launchingLabel.text = "Launch Date: \(detail?.rover?.launchDate ?? "")"
        statusLabel.text = "Status: \(detail?.rover?.status?.uppercased() ?? "")"
        cameraNameLabel.text = "Camera Name: \(detail?.camera?.name ?? "")"
        vehicleNameLabel.text = "Rover Name: \(detail?.rover?.name ?? "")"
        capturedDateLabel.text = "Earth Date: \(detail?.earthDate ?? "")"
        dismissView.isUserInteractionEnabled = true
        let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(dismissVC))
        recognizer.direction = .down
        dismissView.addGestureRecognizer(recognizer)
        detailView.layer.cornerRadius = self.view.frame.height * 0.03
        imageView.layer.cornerRadius = 10
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }

}
