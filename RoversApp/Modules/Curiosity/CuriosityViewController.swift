//
//  CuriosityViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import UIKit

class CuriosityViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: CuriosityPresenterInput!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibRowCell = UINib(nibName: roversCellIdentifier, bundle: nil)
        collectionView.register(nibRowCell, forCellWithReuseIdentifier: roversCellIdentifier)
       
    }



}

extension CuriosityViewController:CuriosityPresenterOutput {
    
}

extension CuriosityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: roversCellIdentifier, for: indexPath as IndexPath) as! RoversCollectionViewCell
       
        return cell
    }
    
    
}

extension CuriosityViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 200)
    }
}
