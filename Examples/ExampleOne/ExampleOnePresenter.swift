//
//  
//  ExampleOnePresenter.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation

class ExampleOnePresenter: ExampleOnePresenterProtocol {
    weak var view: ExampleOneViewProtocol?
    var interactor: ExampleOneInteractorInputProtocol?
    var router: ExampleOneRouterProtocol?
    
    
}

extension ExampleOnePresenter: ExampleOneInteractorOutputProtocol {
    
}
