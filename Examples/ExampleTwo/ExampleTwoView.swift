//
//  
//  ExampleTwoView.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import UIKit
import CoreData

class ExampleTwoView: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "productCell")
        return tableView
    }()
    
    lazy var saveDtaBtn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save data", for: .normal)
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return button
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        NSPersistentContainer(name: "Products")
    }()
    
    var products: Products?
    
    var presenter: ExampleTwoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAutoLayout()
        
        presenter?.getMovies()
        
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

                self.saveDtaBtn.isUserInteractionEnabled = result.count > 0 ? false : true
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
    }
    
    func setupView() {
        title = "Fetch movies"
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(saveDtaBtn)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: saveDtaBtn.topAnchor),
            
            saveDtaBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            saveDtaBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveDtaBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveDtaBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func saveData() {
        
        for item in products?.data?.data ?? [] {
            let product = Product(context: persistentContainer.viewContext)
            product.userPlan = item.user_plan
            product.id = Int16(item.id ?? 0)
            product.activityViews = Int16(item.activity_views ?? 0)
            
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print("Unable to Save Book, \(error)")
            }
        }
    }
}

extension ExampleTwoView: ExampleTwoViewProtocol {
    func productsSuccess(products: Products) {
        self.products = products
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func productsFailure(error: String) {
        print(error)
    }
}

extension ExampleTwoView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ExampleTwoView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.data?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductViewCell
        
        if let product = products?.data?.data?[indexPath.row] {
            cell.setData(data: product)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
