//
//  OpportunityPresenter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation

class OpportunityPresenter {
    var view: OpportunityPresenterOutput?
    var interactor: OpportunityInteractorInput?
    var router: OpportunityRouterProtocol?
}

extension OpportunityPresenter: OpportunityPresenterInput {
    func getCameraFilterOpportunityPhotos(camera: String) {
        self.interactor?.getCameraFilterOpportunityPhotos(camera: camera)
    }
    
    func getMoreCameraFilterOpportunityPhotos(camera: String, pageNo: Int) {
        self.interactor?.getMoreCameraFilterOpportunityPhotos(camera: camera, pageNo: pageNo)
    }
    
    func getOpportunityPhotos() {
        self.interactor?.getOpportunityPhotos()
    }
    
    func getMoreOpportunityPhotos(pageNo: Int) {
        self.interactor?.getMoreOpportunityPhotos(pageNo: pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
    
  
}


extension OpportunityPresenter: OpportunityPresenterOutput {
    func didGetCameraFilterOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetCameraFilterOpportunityPhotos(response: response)
    }
    
    func didGetMoreCameraFilterOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetMoreCameraFilterOpportunityPhotos(response: response)
    }
    
    func didGetOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetOpportunityPhotos(response: response)
    }
    
    func didGetMoreOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetMoreOpportunityPhotos(response: response)
    }
    

}

