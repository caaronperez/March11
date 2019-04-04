//
//  ViewController.swift
//  GameOfThronesAPICrawler
//
//  Created by Jeremiah Hawks on 4/3/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var jsonDictionaryReturn: [String: Any] = [:]
    var jsonArrayReturn: [Any] = []
    var dictionaryKeys: [String] {
        return jsonDictionaryReturn.keys.sorted(by: < )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonDictionaryReturn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let key = dictionaryKeys[indexPath.row]
        guard let value = jsonDictionaryReturn[key] else { return UITableViewCell() }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // should search for image?
        // should pass array to new view controller?
        // should pass dictionary to new view controller?
        // should load JSON from url?
        // instantiate new VC and pass it a URL, dictionary, or array, and the rest happens automagically
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyVC")
        vc.setup(with: array)
        show(vc)
    }
}

