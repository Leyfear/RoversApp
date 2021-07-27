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
        camessss(type: .Spirit)
    }
    
}
//MARK: - PresenterOutput
extension SpiritViewController: SpiritPresenterOutput {
    func didGetSpiritPhotos(response: PhotosResponse) {
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
