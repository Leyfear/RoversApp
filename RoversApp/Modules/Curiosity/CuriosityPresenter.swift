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
    func getMoreCameraFilterCuriosityPhotos(camera: String, pageNo: Int) {
        self.interactor?.getMoreCameraFilterCuriosityPhotos(camera: camera, pageNo: pageNo)
    }
    
    func getCameraFilterCuriosityPhotos(camera: String) {
        self.interactor?.getCameraFilterCuriosityPhotos(camera:camera)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
    
    func getMoreCuriosityPhotos(pageNo: Int) {
        self.interactor?.getMoreCuriosityPhotos(pageNo:pageNo)
    }
    
    func getCuriosityPhotos() {
        self.interactor?.getCuriosityPhotos()
    }
}


extension CuriosityPresenter: CuriosityPresenterOutput {
    func didGetMoreCameraFilterCuriosityPhotos(response: PhotosResponse) {
        self.view?.didGetMoreCuriosityPhotos(response: response)
    }
    
    func didGetCameraFilterCuriosityPhotos(response: PhotosResponse) {
        self.view?.didGetCameraFilterCuriosityPhotos(response:response)
    }
    
    func didGetMoreCuriosityPhotos(response: PhotosResponse) {
        self.view?.didGetMoreCuriosityPhotos(response:response)
    }
    
    func didGetCuriosityPhotos(response: PhotosResponse) {
        self.view?.didGetCuriosityPhotos(response:response)
    }
}

