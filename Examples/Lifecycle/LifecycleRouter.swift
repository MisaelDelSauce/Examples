//
//  
//  LifecycleRouter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

class LifecycleRouter: LifecycleRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = LifecycleView()
        let presenter: LifecyclePresenterProtocol & LifecycleInteractorOutputProtocol = LifecyclePresenter()
        let interactor: LifecycleInteractorInputProtocol = LifecycleInteractor()
        let router: LifecycleRouterProtocol = LifecycleRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
