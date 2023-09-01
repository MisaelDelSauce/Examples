//
//  
//  LifecycleView.swift
//  Examples
//
//  Created by Misael on 01/09/23.
//
//

import UIKit

class LifecycleView: UIViewController {
    
    lazy var lifecycle: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.font = UIFont.systemFont(ofSize: 20)
        
       return textView
    }()
    
    var presenter: LifecyclePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupAutoLayout()
        
        lifecycle.text = "El ciclo de vida de un View Controller está marcado por los siguientes métodos: \n\nloadView(): Este método se ejecuta cuando se crea a partir de código, esta acción hace conecta la vista a la supervista. \n\nviewDidLoad(): Este método se llama una sola vez cuando haya cargado todas las vistas del controlador.\n\nviewWillAppear(): Se llama a este método cada vez que la vista este visible y antes de confugurar cualquier animación.\n\nviewWillLayoudSubviews(): Cuando los límites cambian, por ejemplo, cuando la vista cambia a lanscape, se ajusta la posicion de las sub vistas, entonces es cuando se dispara este método.\n\niewDidLayoudSubviews(): Este método es cuando terminar de ajustar las subvistas.\n\nviewDidAppear(): Se llama a este método cuando esta visible la vista, aquí es donde podemos configurar animaciones.\n\nviewDidDisappear(): Este método se llama cuando la vista se haya eliminado de la jerarquía de vistas.\n\ndeinit: Se llama antes de que el controlador se elimine de la memoria.\n\ndidReceiveMemoryWarning(): Cuando la memoria empieza agotarse, es cuando se dispara la llamada a este mññetodo.\n\nviewWillTransition(): Este método se llama cuando camia la orientación del dispositivo."
    }
    
    func setupView() {
        title = "Lifecycle"
        view.backgroundColor = .white
        view.addSubview(lifecycle)
    }
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([
            lifecycle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            lifecycle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lifecycle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            lifecycle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension LifecycleView: LifecycleViewProtocol {
    
}
