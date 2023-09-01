//
//  
//  MainPresenter.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var router: MainRouterProtocol?
    
    func goToExampleOne() {
        if let view = view as? MainView, let navigation = view.navigationController {
            router?.pushToExampleOne(navigation: navigation)
        }
    }
    
    func goToExampleTwo() {
        if let view = view as? MainView, let navigation = view.navigationController {
            router?.pushToExampleTwo(navigation: navigation)
        }
    }
    
    func goToExampleThree() {
        if let view = view as? MainView, let navigation = view.navigationController {
            router?.pushToExampleThree(navigation: navigation)
        }
    }
    
    func goToExampleFour() {
        if let view = view as? MainView, let navigation = view.navigationController {
            router?.pushToExampleFour(navigation: navigation)
        }
    }
    
    func goToExampleFive() {
        if let view = view as? MainView, let navigation = view.navigationController {
            router?.pushToExampleFive(navigation: navigation)
        }
    }
}

extension MainPresenter: MainInteractorOutputProtocol {
    
}
