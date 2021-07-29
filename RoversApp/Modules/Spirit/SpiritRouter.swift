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
        view.title = RoverType.Spirit.rawValue
        view.presenter = presenter
        interactor.output = presenter
        let controller = view
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = UIColor.white
        return navigationController
    }
}

extension SpiritRouter: SpiritRouterProtocol {
    func navigateToDetail(detail: Photos) {
        let viewController = DetailPopUpViewController()
        viewController.detail = detail
        viewController.modalPresentationStyle = .popover
        self.view.present(viewController, animated: true, completion: nil)
    }
}
