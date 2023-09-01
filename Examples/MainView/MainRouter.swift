//
//  
//  MainRouter.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = MainView()
        let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
        let interactor: MainInteractorInputProtocol = MainInteractor()
        let router: MainRouterProtocol = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToExampleOne(navigation: UINavigationController) {
        let example = ExampleOneRouter.createModule()
        navigation.pushViewController(example, animated: true)
    }
    
    func pushToExampleTwo(navigation: UINavigationController) {
        let example = ExampleTwoRouter.createModule()
        navigation.pushViewController(example, animated: true)
    }
    
    func pushToExampleThree(navigation: UINavigationController) {
        let example = ExampleThreeRouter.createModule()
        navigation.pushViewController(example, animated: true)
    }
    
    func pushToExampleFour(navigation: UINavigationController) {
        let example = ExampleFourRouter.createModule()
        navigation.pushViewController(example, animated: true)
    }
    
    func pushToExampleFive(navigation: UINavigationController) {
        let lifecycle = LifecycleRouter.createModule()
        navigation.pushViewController(lifecycle, animated: true)
    }
}
