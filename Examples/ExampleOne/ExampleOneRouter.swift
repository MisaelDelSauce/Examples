//
//  
//  ExampleOneRouter.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation
import UIKit

class ExampleOneRouter: ExampleOneRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = ExampleOneView()
        let presenter: ExampleOnePresenterProtocol & ExampleOneInteractorOutputProtocol = ExampleOnePresenter()
        let interactor: ExampleOneInteractorInputProtocol = ExampleOneInteractor()
        let router: ExampleOneRouterProtocol = ExampleOneRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
