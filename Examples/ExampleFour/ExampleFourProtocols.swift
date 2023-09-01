//
//  
//  ExampleFourProtocols.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

protocol ExampleFourViewProtocol: AnyObject {
    var presenter: ExampleFourPresenterProtocol? { get set }
    
    func locationsSuccess(locations: Locations)
    func locationsFailure()
}

protocol ExampleFourPresenterProtocol: AnyObject {
    var view: ExampleFourViewProtocol? { get set }
    var interactor: ExampleFourInteractorInputProtocol? { get set }
    var router: ExampleFourRouterProtocol? { get set }
    
    func getLocations()
}

protocol ExampleFourInteractorInputProtocol: AnyObject {
    var presenter: ExampleFourInteractorOutputProtocol? { get set }
    
    func onRequestLocations()
}

protocol ExampleFourInteractorOutputProtocol: AnyObject {
    func onResponseLocationsSuccess(locations: Locations)
    func onResponseLocationsFailure()
}

protocol ExampleFourRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
