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
  
}


extension OpportunityPresenter: OpportunityPresenterOutput {

}

