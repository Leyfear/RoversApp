//
//  OpportunityRouter.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation
import UIKit

class OpportunityRouter {
    var view = OpportunityViewController()
    
    func prepareView() -> UINavigationController {
        let interactor = OpportunityInteractor()
        let presenter = OpportunityPresenter()
        
        presenter.interactor = interactor
        presenter.router = self
        presenter.view = self.view
        view.title = RoverType.Opportunity.rawValue
        view.presenter = presenter
        interactor.output = presenter
        let controller = view
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = UIColor.white
        return navigationController
    }
}

extension OpportunityRouter: OpportunityRouterProtocol {
    func navigateToDetail(detail: Photos) {
        let viewController = DetailPopUpViewController()
        viewController.detail = detail
        viewController.modalPresentationStyle = .popover
        self.view.present(viewController, animated: true, completion: nil)
    }
    
    
}
