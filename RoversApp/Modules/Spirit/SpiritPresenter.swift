//
//  SpiritPresenter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class SpiritPresenter {
    var view: SpiritPresenterOutput?
    var interactor: SpiritInteractorInput?
    var router: SpiritRouterProtocol?
}

extension SpiritPresenter: SpiritPresenterInput {

    
    func getCameraFilterSpiritPhotos(camera: String, pageNo: Int) {
        self.interactor?.getCameraFilterSpiritPhotos(camera: camera, pageNo: pageNo)
    }
    

    
    func getSpiritPhotos(pageNo: Int) {
        self.interactor?.getSpiritPhotos(pageNo:pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
}


extension SpiritPresenter: SpiritPresenterOutput {
    func didGetError() {
        self.view?.didGetError()
    }
    
    func didGetSpiritPhotos(response: PhotosResponse) {
        self.view?.didGetSpiritPhotos(response: response)
    }
}
