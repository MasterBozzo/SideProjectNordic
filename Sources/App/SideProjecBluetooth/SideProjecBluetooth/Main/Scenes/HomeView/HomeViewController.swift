//
//  ViewController.swift
//  SideProjecBluetooth
//
//  Created by Pawel Kacela on 23/04/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }


}

