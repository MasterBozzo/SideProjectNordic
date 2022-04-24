//
//  ViewController.swift
//  SideProjecBluetooth
//
//  Created by Pawel Kacela on 23/04/2022.
//

import UIKit
import CoreBluetooth

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var centralManager: CBCentralManager!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupViews()
        setupHierarchy()
        setupLayout()
        registerCells()
        
        centralManager = CBCentralManager()
        centralManager.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func registerCells() {
        collectionView.register(DeviceCell.self, forCellWithReuseIdentifier: DeviceCell.identifier)
    }

}


//MARK: Layout delegate
extension HomeViewController: UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width - 32, height: 60)
    }
}

//MARK:  Data source delgate
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.discoveredPeripherals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeviceCell.identifier, for: indexPath)
        return cell
    }
    
}


// MARK: - CBCentralManagerDelegate

extension HomeViewController: CBCentralManagerDelegate {
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let newPeripheral = BlinkyPeripheral(withPeripheral: peripheral, advertisementData: advertisementData, andRSSI: RSSI, using: centralManager)
        if !viewModel.discoveredPeripherals.contains(newPeripheral) {
            viewModel.discoveredPeripherals.append(newPeripheral)
            collectionView.reloadData()
        } else {
            if let index = viewModel.discoveredPeripherals.firstIndex(of: newPeripheral) {
                if let aCell = collectionView.cellForItem(at: [0, index]) as? DeviceCell {
                    let device = DeviceCellViewModel(name: newPeripheral.advertisedName ?? "unknow")
                    aCell.update(with: device)
                }
            }
        }
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state != .poweredOn {
            print("Central is not powered on")
        } else {
            Log.dev(message: "scan for device")
            centralManager.scanForPeripherals(withServices: [BlinkyPeripheral.nordicBlinkyServiceUUID],
                                              options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])
        }
    }
}
