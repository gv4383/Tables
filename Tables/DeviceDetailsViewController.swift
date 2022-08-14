//
//  DeviceDetailsViewController.swift
//  Tables
//
//  Created by Goyo Vargas on 8/13/22.
//

import UIKit

class DeviceDetailsViewController: UIViewController {
    var device: Device!
    
    let categoryLabel = UILabel()
    let descriptionLabel = UILabel()
    let descriptionContainerView = UIView()
    
    init(device: Device) {
        super.init(nibName: nil, bundle: nil)
        self.device = device
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureLabels()
        configureContainerView()
        layoutUI()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        title = device.name
        categoryLabel.text = "Category - \(device.category)"
        descriptionLabel.text = device.description
    }
    
    private func configureLabels() {
        categoryLabel.backgroundColor = .systemBackground
        descriptionLabel.backgroundColor = .systemBackground
        descriptionLabel.sizeToFit()
        descriptionLabel.numberOfLines = 0
    }
    
    private func configureContainerView() {
        descriptionContainerView.backgroundColor = .systemBackground
    }
    
    private func layoutUI() {
        view.addSubview(categoryLabel)
        view.addSubview(descriptionContainerView)
        descriptionContainerView.addSubview(descriptionLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainerView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            categoryLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionContainerView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: padding),
            descriptionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            descriptionContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContainerView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor)
        ])
    }
}
