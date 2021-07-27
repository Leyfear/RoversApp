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
    func getSpiritPhotos() {
        self.interactor?.getSpiritPhotos()
    }
    
    func getMoreSpiritPhotos(pageNo: Int) {
        self.interactor?.getMoreSpiritPhotos(pageNo:pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
}


extension SpiritPresenter: SpiritPresenterOutput {
    func didGetSpiritPhotos(response: PhotosResponse) {
        self.view?.didGetSpiritPhotos(response: response)
    }
    
    func didGetMoreSpiritPhotos(response: PhotosResponse) {
        self.view?.didGetMoreSpiritPhotos(response: response)
    }
}
