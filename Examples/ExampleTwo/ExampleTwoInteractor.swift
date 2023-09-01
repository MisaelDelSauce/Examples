//
//  
//  ExampleTwoInteractor.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import Foundation

class ExampleTwoInteractor: ExampleTwoInteractorInputProtocol {
    weak var presenter: ExampleTwoInteractorOutputProtocol?
    
    func onRequestMovies() {
        DispatchQueue.global(qos: .utility).async {
            let result = API().makeAPICall()
            DispatchQueue.main.async {
                switch result {
                    case let .success(string):
                        if let data = string?.data(using: .utf8) {
                            do {
                                let products = try JSONDecoder().decode(Products.self, from: data)
                                self.presenter?.onResponseProductsSuccess(products: products)
                            } catch {
                                self.presenter?.onResponseProductsFailure(error: "Error parsing data")
                            }
                        }
                    case let .failure(error):
                        if error == .url {
                            self.presenter?.onResponseProductsFailure(error: "URL errora")
                        } else {
                            self.presenter?.onResponseProductsFailure(error: "Server error")
                        }
                }
            }
        }
    }
}
