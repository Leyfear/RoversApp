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
        self.presenter.getCuriosityPhotos()
        collectionView.delegate = self
        controller(title: .Curiosity)
        delegate = self
    }
    
}
//MARK: - PresenterOutput
extension CuriosityViewController:CuriosityPresenterOutput {
    func didGetMoreCameraFilterCuriosityPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
    
    func didGetCameraFilterCuriosityPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        collectionView.result = response.photos ?? []
    }
    
    func didGetMoreCuriosityPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
    
    func didGetCuriosityPhotos(response: PhotosResponse) {
        collectionView.pageNo = 0
        collectionView.result = response.photos ?? []
    }
}

//MARK: - PhotosCollectionViewDelegate
extension CuriosityViewController: PhotosCollectionViewDelegate{
    func getMorePhotos(pageNo: Int) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getMoreCuriosityPhotos(pageNo: pageNo)
        } else {
            self.presenter.getMoreCameraFilterCuriosityPhotos(camera: selectedCamera ?? "", pageNo: pageNo)
        }
    }
    
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
}
//MARK: - BaseViewControllerDelegate
extension CuriosityViewController: BaseViewControllerDelegate {
    func selectedCam(select: String) {
        if selectedCamera == "" || selectedCamera == nil {
            self.presenter.getCuriosityPhotos()
        }else{
            self.presenter.getCameraFilterCuriosityPhotos(camera: select)
        }
    }
}
