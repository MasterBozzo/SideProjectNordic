//
//  BluetoothAppDependencies.swift
//  SideProjecBluetooth
//
//  Created by Pawel Kacela on 23/04/2022.
//

import UIKit


class BluetoothAppDependencies {
    
    var window: UIWindow?
    
    static let shared = BluetoothAppDependencies()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
    
    internal func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    func start() {
        self.setRootViewController(self.makeHomeViewController())
    }

    func makeHomeViewController() -> UIViewController {
        let viewModel = HomeViewModel()
        let vc = HomeViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: vc)
        return navigationController
    }
}
