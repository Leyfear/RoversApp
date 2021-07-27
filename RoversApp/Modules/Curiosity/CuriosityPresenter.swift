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
  
}


extension CuriosityPresenter: CuriosityPresenterOutput {

}

