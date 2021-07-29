//
//  DetailPopUpView.swift
//  RoversApp
//
//  Created by Tutku on 28.07.2021.
//

import UIKit
import Kingfisher

class DetailPopUpView: UIView {
    @IBOutlet weak var landingLabel: UILabel!
    @IBOutlet weak var launchingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var vehicleNameLabel: UILabel!
    @IBOutlet weak var capturedDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailPopUpView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func fetchDetail(detail: Photos) {
        imageView.layer.cornerRadius = 12
        
        if let imageURL = detail.imgSrc{
            if let url = URL(string: imageURL){
                imageView.kf.setImage(with: url)
            }
        } else {
            self.imageView.image = nil
        }
        landingLabel.text = "Landing Date: \(detail.rover?.landingDate ?? "")"
        launchingLabel.text = "Launch Date: \(detail.rover?.launchDate ?? "")"
        statusLabel.text = "Status: \(detail.rover?.status?.uppercased() ?? "")"
        cameraNameLabel.text = "Camera Name: \(detail.camera?.name ?? "")"
        vehicleNameLabel.text = "Rover Name: \(detail.rover?.name ?? "")"
        capturedDateLabel.text = "Earth Date: \(detail.earthDate ?? "")"
    }
}
