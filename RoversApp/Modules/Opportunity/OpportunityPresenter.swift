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

    func getCameraFilterOpportunityPhotos(camera: String, pageNo: Int) {
        self.interactor?.getCameraFilterOpportunityPhotos(camera: camera, pageNo: pageNo)
    }
        
    func getOpportunityPhotos(pageNo: Int) {
        self.interactor?.getOpportunityPhotos(pageNo: pageNo)
    }
    
    func navigateToDetail(detail: Photos) {
        self.router?.navigateToDetail(detail: detail)
    }
}


extension OpportunityPresenter: OpportunityPresenterOutput {
    func didGetError(){
        self.view?.didGetError()
    }
    
    func didGetOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetOpportunityPhotos(response: response)
    }
}
