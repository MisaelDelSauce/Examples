//
//  
//  ExampleTwoProtocols.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

protocol ExampleTwoViewProtocol: AnyObject {
    var presenter: ExampleTwoPresenterProtocol? { get set }
    
    func productsSuccess(products: Products)
    func productsFailure(error: String)
}

protocol ExampleTwoPresenterProtocol: AnyObject {
    var view: ExampleTwoViewProtocol? { get set }
    var interactor: ExampleTwoInteractorInputProtocol? { get set }
    var router: ExampleTwoRouterProtocol? { get set }
    
    func getMovies()
}

protocol ExampleTwoInteractorInputProtocol: AnyObject {
    var presenter: ExampleTwoInteractorOutputProtocol? { get set }
    
    func onRequestMovies()
}

protocol ExampleTwoInteractorOutputProtocol: AnyObject {
    func onResponseProductsSuccess(products: Products)
    func onResponseProductsFailure(error: String)
    
}

protocol ExampleTwoRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
