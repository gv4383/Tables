//
//  DeviceCell.swift
//  Tables
//
//  Created by Goyo Vargas on 8/10/22.
//

import UIKit

class DeviceCell: UITableViewCell {
    static let reuseId = "DeviceCell"
    
    let deviceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(device: Device) {
        deviceLabel.text = device.name
    }
    
    private func configure() {
        addSubview(deviceLabel)
        deviceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            deviceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            deviceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            deviceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            deviceLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
