//
//  ViewController.swift
//  THE BIG TEST
//
//  Created by Jeremiah Hawks on 3/21/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var dataSource: [TestModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        dataSource = getJSON()
        
    }

    func getJSON() -> [TestModel] {
        let url = Bundle.main.url(forResource: "test", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let objects = try! JSONDecoder().decode(TestModel.self, from: data)
        return [objects]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataSource[indexPath.row].key
        return cell!
    }
    
}

