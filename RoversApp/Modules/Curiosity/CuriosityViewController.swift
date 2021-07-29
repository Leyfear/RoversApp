//
//  CuriosityViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

class CuriosityViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: PhotosCollectionView!
    var presenter: CuriosityPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.getCuriosityPhotos(pageNo: 0)
        collectionView.delegate = self
        controller(title: .Curiosity)
        delegate = self
    }
}
//MARK: - PresenterOutput
extension CuriosityViewController:CuriosityPresenterOutput {
    func didGetError() {
        showAlert()
    }
    
    func didGetCuriosityPhotos(response: PhotosResponse) {
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
extension CuriosityViewController: PhotosCollectionViewDelegate{
    func getMorePhotos(pageNo: Int) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getCuriosityPhotos(pageNo: pageNo)
        } else {
            self.presenter.getCameraFilterCuriosityPhotos(camera: selectedCamera ?? "", pageNo: pageNo)
        }
    }
    
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
}
//MARK: - BaseViewControllerDelegate
extension CuriosityViewController: BaseViewControllerDelegate {
    func selectedCameraType(name: String) {
        collectionView.result.removeAll()
        collectionView.statusLabel.isHidden = true
        collectionView.activityIndicator.startAnimating()
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getCuriosityPhotos(pageNo: 0)
        }else{
            self.presenter.getCameraFilterCuriosityPhotos(camera: name, pageNo: 0)
        }
    }
}
