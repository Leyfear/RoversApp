//
//  RoversCollectionViewCell.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit
import Kingfisher

class RoversCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 6
    }
    
    func configureCell(data: Photos) {
        if let imageURL = data.imgSrc{
            if let url = URL(string: imageURL){
                imageView.kf.setImage(with: url)
            }
        } else {
            self.imageView.image = nil
        }
    }
}
