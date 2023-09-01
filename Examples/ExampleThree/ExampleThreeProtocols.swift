//
//  
//  ExampleThreeProtocols.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

protocol ExampleThreeViewProtocol: AnyObject {
    var presenter: ExampleThreePresenterProtocol? { get set }
}

protocol ExampleThreePresenterProtocol: AnyObject {
    var view: ExampleThreeViewProtocol? { get set }
    var interactor: ExampleThreeInteractorInputProtocol? { get set }
    var router: ExampleThreeRouterProtocol? { get set }
}

protocol ExampleThreeInteractorInputProtocol: AnyObject {
    var presenter: ExampleThreeInteractorOutputProtocol? { get set }
}

protocol ExampleThreeInteractorOutputProtocol: AnyObject {
    
}

protocol ExampleThreeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
