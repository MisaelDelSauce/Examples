//
//  
//  ExampleThreeRouter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

class ExampleThreeRouter: ExampleThreeRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = ExampleThreeView()
        let presenter: ExampleThreePresenterProtocol & ExampleThreeInteractorOutputProtocol = ExampleThreePresenter()
        let interactor: ExampleThreeInteractorInputProtocol = ExampleThreeInteractor()
        let router: ExampleThreeRouterProtocol = ExampleThreeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
