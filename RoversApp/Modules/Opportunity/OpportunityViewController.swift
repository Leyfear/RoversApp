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
        self.presenter.getOpportunityPhotos()
        collectionView.delegate = self
        controller(title: .Opportunity)
        delegate = self
    }
}

//MARK: - PresenterOutput
extension OpportunityViewController: OpportunityPresenterOutput {
    func didGetCameraFilterOpportunityPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        collectionView.result = response.photos ?? []
    }
    
    func didGetMoreCameraFilterOpportunityPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
    
    func didGetOpportunityPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        collectionView.result = response.photos ?? []
    }
    
    func didGetMoreOpportunityPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
}
//MARK: - PhotosCollectionViewDelegate
extension OpportunityViewController: PhotosCollectionViewDelegate{
    func getMorePhotos(pageNo: Int) {
        self.presenter.getMoreOpportunityPhotos(pageNo: pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
}

//MARK: - BaseViewControllerDelegate
extension OpportunityViewController: BaseViewControllerDelegate {
    func selectedCam(select: String) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getOpportunityPhotos()
        }else{
            self.presenter.getCameraFilterOpportunityPhotos(camera: select)
        }
    }
}
