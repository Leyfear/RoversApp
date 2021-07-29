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
        view.title = RoverType.Curiosity.rawValue
        view.presenter = presenter
        interactor.output = presenter
        let controller = view
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = UIColor.white
        return navigationController
    }
}

extension CuriosityRouter: CuriosityRouterProtocol {
    func navigateToDetail(detail: Photos) {
        let viewController = DetailPopUpViewController()
        viewController.detail = detail
        viewController.modalPresentationStyle = .popover
        self.view.present(viewController, animated: true, completion: nil)
    }
}
