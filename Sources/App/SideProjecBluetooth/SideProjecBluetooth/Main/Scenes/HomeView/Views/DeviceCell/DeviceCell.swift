//
//  DeviceCell.swift
//  SideProjecBluetooth
//
//  Created by Pawel Kacela on 23/04/2022.
//

import UIKit

class DeviceCell: UICollectionViewCell {
    
    class var identifier: String {
        return "DeviceCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    func update(with device: DeviceCellViewModel) {
        nameLabel.text = device.name
    }
        
    private func setupViews() {
        
    }
    
    private func setupHierarchy() {
        addSubview(nameLabel)
    }
    
    private func setupLayout() {
        nameLabel.frame = frame
    }
    
   private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Example device name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
