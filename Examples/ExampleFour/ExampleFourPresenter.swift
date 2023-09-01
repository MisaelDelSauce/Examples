//
//  
//  ExampleFourPresenter.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation

class ExampleFourPresenter: ExampleFourPresenterProtocol {
    weak var view: ExampleFourViewProtocol?
    var interactor: ExampleFourInteractorInputProtocol?
    var router: ExampleFourRouterProtocol?
    
    func getLocations() {
        interactor?.onRequestLocations()
    }
    
}

extension ExampleFourPresenter: ExampleFourInteractorOutputProtocol {
    func onResponseLocationsSuccess(locations: Locations) {
        view?.locationsSuccess(locations: locations)
    }
    
    func onResponseLocationsFailure() {
        view?.locationsFailure()
    }
}
