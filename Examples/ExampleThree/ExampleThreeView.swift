//
//  
//  ExampleThreeView.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import UIKit
import CoreData

class ExampleThreeView: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "productCell")
        return tableView
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        NSPersistentContainer(name: "Products")
    }()
    
    var products: [Product]?
    
    var presenter: ExampleThreePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAutoLayout()
                
        persistentContainer.loadPersistentStores { persistentStoreDescription, error in
            if let error = error {
                print("Unable to Add Persistent Store")
                print("\(error), \(error.localizedDescription)")

            } else {
                print(persistentStoreDescription.url as Any, persistentStoreDescription.type)
            }
        }
        
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        persistentContainer.viewContext.perform {
            do {
                let result = try fetchRequest.execute()
                self.products = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    
    func setupView() {
        title = "Fetch movies"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

extension ExampleThreeView: ExampleThreeViewProtocol {
    
}

extension ExampleThreeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ExampleThreeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductViewCell
        
        if let product = products?[indexPath.row] {
            cell.setDataFromCoreData(data: product)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
