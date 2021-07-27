//
//  SpiritRouter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation
import UIKit

class SpiritRouter {
    var view = SpiritViewController()
    
    func prepareView() -> UINavigationController {
        let interactor = SpiritInteractor()
        let presenter = SpiritPresenter()
        
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = self.view
        view.title = "Spirit"
        view.presenter = presenter
        interactor.output = presenter
        let controller = view
        let nc = UINavigationController(rootViewController: controller)
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.tintColor = UIColor.white
        return nc
    }
}

extension SpiritRouter: SpiritRouterProtocol {
    
}
