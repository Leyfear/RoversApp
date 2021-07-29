//
//  PhotosCollectionView.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

protocol PhotosCollectionViewDelegate {
    func navigateToDetail(detail: Photos)
    func getMorePhotos(pageNo: Int)
}

class PhotosCollectionView: UIView {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: PhotosCollectionViewDelegate?
    var pageNo = 0
    var getMoreData: Bool = true
    var result: [Photos] = [] {
        didSet {
            getMoreData = true
            collectionView.reloadData()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("PhotosCollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibRowCell = UINib(nibName: roversCellIdentifier, bundle: nil)
        collectionView.register(nibRowCell, forCellWithReuseIdentifier: roversCellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
    }
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension PhotosCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: roversCellIdentifier, for: indexPath as IndexPath) as! RoversCollectionViewCell
        let data = result[indexPath.row]
        cell.configureCell(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.navigateToDetail(detail: result[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == (self.result.count) - 1) && (self.getMoreData){
            pageNo += 1
            delegate?.getMorePhotos(pageNo: pageNo)
        }
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.45)
    }
}
