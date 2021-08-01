//
//  ViewController.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    var dataViewModel = DataViewModel()
    
    //MARK: - IBOutlets
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    @IBOutlet weak var instaTableView: UITableView!
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dataViewModel.vc = self
        dataViewModel.callTheResponseData()
        
    }
    
    //MARK: - Functions
    
    func setUI() {
        // TableView
        instaTableView.delegate = self
        instaTableView.dataSource = self
        let nib = UINib(nibName: "InstaCell", bundle: nil)
        instaTableView.register(nib, forCellReuseIdentifier: "InstaCell")
        
        // CollectionView
        topCollectionView.dataSource = self
        let collNib = UINib(nibName: "CollCell", bundle: nil)
        topCollectionView.register(collNib, forCellWithReuseIdentifier: "CollCell")
        topCollectionView.layer.borderColor = UIColor.black.cgColor
        topCollectionView.layer.borderWidth = 0.4
            }
}

//MARK: - Extension for TableView


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataViewModel.arrayListResult.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstaCell", for: indexPath) as! InstaCell
        cell.setCellData(data: dataViewModel, index: indexPath)
        return cell
    }
}

//MARK: - CollectionView Extension


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataViewModel.arrayListResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath) as? CollCell else {
            return UICollectionViewCell()
        }
        let data = dataViewModel.arrayListResult[indexPath.item]
        collectionCell.nameLable.text =
            data.name.first
        collectionCell.storyImage.downloaded(from: data.picture.thumbnail)
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.layer.bounds.width - (UICollectionViewCell().layer.frame.width / 2)
        let height = collectionView.layer.bounds.height
        return CGSize(width: width, height: height)
    }
    
}
