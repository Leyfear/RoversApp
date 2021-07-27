//
//  CuriosityRouter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation
import UIKit

class CuriosityRouter {
    var view = CuriosityViewController()
    
    func prepareView() -> UIViewController {
        let interactor = CuriosityInteractor()
        let presenter = CuriosityPresenter()
        
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = self.view
        view.title = "Curiosity"
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}

extension CuriosityRouter: CuriosityRouterProtocol {
    
}
