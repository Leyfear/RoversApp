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
    func didGetOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetOpportunityPhotos(response: response)
    }
    
    func didGetMoreOpportunityPhotos(response: PhotosResponse) {
        self.view?.didGetMoreOpportunityPhotos(response: response)
    }
    

}

