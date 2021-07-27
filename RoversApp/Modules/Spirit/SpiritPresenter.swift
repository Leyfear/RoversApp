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
  
}


extension SpiritPresenter: SpiritPresenterOutput {

}

