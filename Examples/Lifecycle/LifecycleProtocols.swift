//
//  
//  LifecycleProtocols.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation
import UIKit

protocol LifecycleViewProtocol: AnyObject {
    var presenter: LifecyclePresenterProtocol? { get set }
}

protocol LifecyclePresenterProtocol: AnyObject {
    var view: LifecycleViewProtocol? { get set }
    var interactor: LifecycleInteractorInputProtocol? { get set }
    var router: LifecycleRouterProtocol? { get set }
}

protocol LifecycleInteractorInputProtocol: AnyObject {
    var presenter: LifecycleInteractorOutputProtocol? { get set }
}

protocol LifecycleInteractorOutputProtocol: AnyObject {
    
}

protocol LifecycleRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
