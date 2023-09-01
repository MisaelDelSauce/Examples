//
//  
//  LifecyclePresenter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation

class LifecyclePresenter: LifecyclePresenterProtocol {
    weak var view: LifecycleViewProtocol?
    var interactor: LifecycleInteractorInputProtocol?
    var router: LifecycleRouterProtocol?
    
    
}

extension LifecyclePresenter: LifecycleInteractorOutputProtocol {
    
}
