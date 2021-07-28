//
//  SpiritViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

class SpiritViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: PhotosCollectionView!
    var presenter: SpiritPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getSpiritPhotos()
        collectionView.delegate = self
        controller(title: .Spirit)
        delegate = self
    }
}
//MARK: - PresenterOutput
extension SpiritViewController: SpiritPresenterOutput {
    func didGetCameraFilterSpiritPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        collectionView.result = response.photos ?? []
    }
    
    func didGetMoreCameraFilterSpiritPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
    
    func didGetSpiritPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        self.collectionView.result = response.photos ?? []
    }
    
    func didGetMoreSpiritPhotos(response: PhotosResponse) {
        self.collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
}
//MARK: - PhotosCollectionViewDelegate
extension SpiritViewController: PhotosCollectionViewDelegate {
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
    
    func getMorePhotos(pageNo: Int) {
        self.collectionView.shouldGetMoreData = false
        self.presenter.getMoreSpiritPhotos(pageNo: pageNo)
    }
}

//MARK: - BaseViewControllerDelegate
extension SpiritViewController: BaseViewControllerDelegate {
    func selectedCam(select: String) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getSpiritPhotos()
        }else{
            self.presenter.getCameraFilterSpiritPhotos(camera: select)
        }
    }
}
