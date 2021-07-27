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
        camessss(type: .Curiosity)
    }
        
}
//MARK: - PresenterOutput
extension CuriosityViewController:CuriosityPresenterOutput {
    func didGetMoreCuriosityPhotos(response: PhotosResponse) {
        collectionView.shouldGetMoreData = false
        if (response.photos?.count ?? 0) > 0 {
            collectionView.result.append(contentsOf: response.photos ?? [])
        }
    }
    
    func didGetCuriosityPhotos(response: PhotosResponse) {
        collectionView.result = response.photos ?? []
    }
}

//MARK: - PhotosCollectionViewDelegate
extension CuriosityViewController: PhotosCollectionViewDelegate{
    func getMorePhotos(pageNo: Int) {
        self.presenter.getMoreCuriosityPhotos(pageNo: pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.presenter.navigateToDetail(detail: detail)
    }
}
