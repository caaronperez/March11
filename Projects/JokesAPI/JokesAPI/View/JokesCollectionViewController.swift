//
//  JokesCollectionViewController.swift
//  JokesAPI
//
//  Created by MAC on 3/28/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class JokesCollectionViewController: UIViewController {

    @IBOutlet weak var jokesCollectionView: UICollectionView!
    
    var jokes = [Joke]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesCollectionView.dataSource = self
        jokesCollectionView.delegate = self
        
        jokesCollectionView.register(UINib(nibName: "JokeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JokeCollectionViewCell")
    }
}

extension JokesCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JokeCollectionViewCell", for: indexPath) as! JokeCollectionViewCell
        cell.configure(with: jokes[indexPath.item])
        return cell
    }
}

extension JokesCollectionViewController: UICollectionViewDelegate {
    
}

extension JokesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
