//
//  
//  MainView.swift
//  Examples
//
//  Created by Misael on 31/08/23.
//
//

import UIKit

class MainView: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        return tableView
    }()
    
    let examples = ["Example 1", "Example 2", "Example 3", "Example 4", "Lifecycle"]
    
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupAutoLayout()
    }
    
    func setupView() {
        title = "Examples"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}

extension MainView: MainViewProtocol {
    
}

extension MainView: UITableViewDelegate {
    
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
          cell.textLabel?.text = examples[indexPath.row]
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch indexPath.row {
        case 0:
            presenter?.goToExampleOne()
        case 1:
            presenter?.goToExampleTwo()
        case 2:
            presenter?.goToExampleThree()
        case 3:
            presenter?.goToExampleFour()
        case 4:
            presenter?.goToExampleFive()
        default:
            break
        }
    }
}
