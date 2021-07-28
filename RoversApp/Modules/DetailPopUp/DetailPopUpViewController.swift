//
//  DetailPopUpViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

class DetailPopUpViewController: UIViewController {
    @IBOutlet weak var detailPopUpView: DetailPopUpView!
    var detail: Photos!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailPopUpView.fetchDetail(detail: detail)
    }
}
