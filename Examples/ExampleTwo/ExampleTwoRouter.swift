//
//  
//  ExampleTwoRouter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

class ExampleTwoRouter: ExampleTwoRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = ExampleTwoView()
        let presenter: ExampleTwoPresenterProtocol & ExampleTwoInteractorOutputProtocol = ExampleTwoPresenter()
        let interactor: ExampleTwoInteractorInputProtocol = ExampleTwoInteractor()
        let router: ExampleTwoRouterProtocol = ExampleTwoRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
