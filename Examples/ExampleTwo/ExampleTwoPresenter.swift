//
//  
//  ExampleTwoPresenter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation

class ExampleTwoPresenter: ExampleTwoPresenterProtocol {
    weak var view: ExampleTwoViewProtocol?
    var interactor: ExampleTwoInteractorInputProtocol?
    var router: ExampleTwoRouterProtocol?
    
    func getMovies() {
        interactor?.onRequestMovies()
    }
}

extension ExampleTwoPresenter: ExampleTwoInteractorOutputProtocol {
    func onResponseProductsSuccess(products: Products) {
        view?.productsSuccess(products: products)
    }
    
    func onResponseProductsFailure(error: String) {
        view?.productsFailure(error: error)
    }
}
