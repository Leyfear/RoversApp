//
//  OpportunityViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

class OpportunityViewController: BaseViewController {
    @IBOutlet weak var collectionView: PhotosCollectionView!
    var presenter: OpportunityPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getOpportunityPhotos(pageNo: 0)
        collectionView.delegate = self
        controller(title: .Opportunity)
        delegate = self
    }
}

//MARK: - PresenterOutput
extension OpportunityViewController: OpportunityPresenterOutput {
    func didGetError() {
        showAlert()
    }
    
    func didGetOpportunityPhotos(response: PhotosResponse) {
        collectionView.activityIndicator.stopAnimating()
        collectionView.getMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }else if collectionView.result.count == 0{
            collectionView.statusLabel.isHidden = false
        }
    }
}
//MARK: - PhotosCollectionViewDelegate
extension OpportunityViewController: PhotosCollectionViewDelegate{
    func getMorePhotos(pageNo: Int) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getOpportunityPhotos(pageNo: pageNo)
        } else {
            self.presenter.getCameraFilterOpportunityPhotos(camera: selectedCamera ?? "", pageNo: pageNo)
        }
    }
    
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
}

//MARK: - BaseViewControllerDelegate
extension OpportunityViewController: BaseViewControllerDelegate {
    func selectedCameraType(name: String) {
        collectionView.result.removeAll()
        collectionView.statusLabel.isHidden = true
        collectionView.activityIndicator.startAnimating()
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getOpportunityPhotos(pageNo: 0)
        }else{
            self.presenter.getCameraFilterOpportunityPhotos(camera: name, pageNo:0)
        }
    }
}
