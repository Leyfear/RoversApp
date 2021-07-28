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
        let nc = UINavigationController(rootViewController: controller)
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.tintColor = UIColor.white
        return nc
    }
}

extension CuriosityRouter: CuriosityRouterProtocol {
    func navigateToDetail(detail: Photos) {
        let vc = DetailPopUpViewController()
        vc.detail = detail
        vc.modalPresentationStyle = .popover
        self.view.present(vc, animated: true, completion: nil)
    }
}
