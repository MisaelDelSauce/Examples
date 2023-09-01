//
//  
//  ExampleOneProtocols.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation
import UIKit

protocol ExampleOneViewProtocol: AnyObject {
    var presenter: ExampleOnePresenterProtocol? { get set }
}

protocol ExampleOnePresenterProtocol: AnyObject {
    var view: ExampleOneViewProtocol? { get set }
    var interactor: ExampleOneInteractorInputProtocol? { get set }
    var router: ExampleOneRouterProtocol? { get set }
}

protocol ExampleOneInteractorInputProtocol: AnyObject {
    var presenter: ExampleOneInteractorOutputProtocol? { get set }
}

protocol ExampleOneInteractorOutputProtocol: AnyObject {
    
}

protocol ExampleOneRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
