//
//  
//  ExampleOneView.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import UIKit

class ExampleOneView: UIViewController {
    
    lazy var result: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
       return label
    }()
    
    var presenter: ExampleOnePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupAutoLayout()
        
        let sumIntegers = sumIntegers(array: [1,2,3,4])
        result.text = "La suma es: \(sumIntegers)"
    }
    
    func setupView() {
        title = "Sum integers"
        view.backgroundColor = .white
        view.addSubview(result)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            result.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            result.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    func sumIntegers(array: [Int]) -> Int {
        return array.reduce(0, +)
    }
}

extension ExampleOneView: ExampleOneViewProtocol {
    
}
