//
//  DeviceDetailsViewController.swift
//  Tables
//
//  Created by Goyo Vargas on 8/13/22.
//

import UIKit

class DeviceDetailsViewController: UIViewController {
    var device: Device!
    
    init(device: Device) {
        super.init(nibName: nil, bundle: nil)
        self.device = device
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        print("DEVICE: \(device.name)")
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        title = device.name
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
