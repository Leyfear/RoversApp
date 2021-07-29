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
        self.presenter.getSpiritPhotos(pageNo: 0)
        collectionView.delegate = self
        controller(title: .Spirit)
        delegate = self
    }
}

//MARK: - PresenterOutput
extension SpiritViewController: SpiritPresenterOutput {
    func didGetError() {
        showAlert()
    }
    
    func didGetSpiritPhotos(response: PhotosResponse) {
        collectionView.activityIndicator.stopAnimating()
        collectionView.getMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        } else if collectionView.result.count == 0 {
            collectionView.statusLabel.isHidden = false
        }
    }
}
//MARK: - PhotosCollectionViewDelegate
extension SpiritViewController: PhotosCollectionViewDelegate {
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
    
    func getMorePhotos(pageNo: Int) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getSpiritPhotos(pageNo: pageNo)
        } else {
            self.presenter.getCameraFilterSpiritPhotos(camera: selectedCamera ?? "", pageNo: pageNo)
        }
    }
}

//MARK: - BaseViewControllerDelegate
extension SpiritViewController: BaseViewControllerDelegate {
    func selectedCameraType(name: String) {
        collectionView.result.removeAll()
        collectionView.statusLabel.isHidden = true
        collectionView.activityIndicator.startAnimating()
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getSpiritPhotos(pageNo: 0)
        }else{
            self.presenter.getCameraFilterSpiritPhotos(camera: name, pageNo: 0)
        }
    }
}
