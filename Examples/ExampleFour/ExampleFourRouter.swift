//
//  
//  ExampleFourRouter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

class ExampleFourRouter: ExampleFourRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = ExampleFourView()
        let presenter: ExampleFourPresenterProtocol & ExampleFourInteractorOutputProtocol = ExampleFourPresenter()
        let interactor: ExampleFourInteractorInputProtocol = ExampleFourInteractor()
        let router: ExampleFourRouterProtocol = ExampleFourRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
