//
//  ViewController.swift
//  Tables
//
//  Created by Goyo Vargas on 8/10/22.
//

import UIKit

class ViewController: UIViewController {
    let tableView = UITableView()
    var devices = [Device]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        devices = fetchDevices()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemPink
        title = "Devices"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeviceCell.self, forCellReuseIdentifier: DeviceCell.reuseId)
    }
    
    private func fetchDevices() -> [Device] {
        let path = Bundle.main.path(forResource: "iot_devices", ofType: "json")
        
        guard let path = path else {
            print("Error: bad file path")
            
            return []
        }
        
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            if let deviceData = try? decoder.decode([Device].self, from: data) {
                return deviceData
            } else {
                print("Error: something went wrong parsing device data")
                
                return []
            }
        } catch {
            print("Error: there was a problem fetching devices")
            
            return []
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceCell.reuseId) as! DeviceCell
        let device = devices[indexPath.row]
        cell.set(device: device)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let device = devices[indexPath.row]
        let destinationVC = DeviceDetailsViewController(device: device)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

