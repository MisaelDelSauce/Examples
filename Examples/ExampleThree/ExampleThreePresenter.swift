//
//  
//  ExampleThreePresenter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation

class ExampleThreePresenter: ExampleThreePresenterProtocol {
    weak var view: ExampleThreeViewProtocol?
    var interactor: ExampleThreeInteractorInputProtocol?
    var router: ExampleThreeRouterProtocol?
    
    
}

extension ExampleThreePresenter: ExampleThreeInteractorOutputProtocol {
    
}
