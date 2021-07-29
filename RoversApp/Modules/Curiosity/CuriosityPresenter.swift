//
//  CuriosityPresenter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class CuriosityPresenter {
    var view: CuriosityPresenterOutput?
    var interactor: CuriosityInteractorInput?
    var router: CuriosityRouterProtocol?
}

extension CuriosityPresenter: CuriosityPresenterInput {
    func getCameraFilterCuriosityPhotos(camera: String, pageNo: Int) {
        self.interactor?.getCameraFilterCuriosityPhotos(camera: camera, pageNo: pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
    
    func getCuriosityPhotos(pageNo: Int) {
        self.interactor?.getCuriosityPhotos(pageNo:pageNo)
    }
}

extension CuriosityPresenter: CuriosityPresenterOutput {
    func didGetError() {
        self.view?.didGetError()
    }
    
    func didGetCuriosityPhotos(response: PhotosResponse) {
        self.view?.didGetCuriosityPhotos(response:response)
    }
}
