//
//  
//  MainProtocols.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    func goToExampleOne()
    func goToExampleTwo()
    func goToExampleThree()
    func goToExampleFour()
    func goToExampleFive()
}

protocol MainInteractorInputProtocol: AnyObject {
    var presenter: MainInteractorOutputProtocol? { get set }
}

protocol MainInteractorOutputProtocol: AnyObject {
    
}

protocol MainRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func pushToExampleOne(navigation: UINavigationController)
    func pushToExampleTwo(navigation: UINavigationController)
    func pushToExampleThree(navigation: UINavigationController)
    func pushToExampleFour(navigation: UINavigationController)
    func pushToExampleFive(navigation: UINavigationController)
}
