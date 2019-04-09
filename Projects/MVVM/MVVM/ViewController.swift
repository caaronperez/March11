//
//  ViewController.swift
//  MVVM
//
//  Created by Jeremiah Hawks on 4/5/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel: ViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewModel = ViewModel()
        setupTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(updateMe), name: NSNotification.Name(rawValue: "updateTableVeiw"), object: nil)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func updateMe() {
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.fetchDisplay(for: indexPath)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}


