//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: - Properties
    var searchDataViewModel = DataViewModel()
    
    //MARK: - IBOutlets
    
    
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchDataViewModel.searchVC = self
        searchDataViewModel.callTheResponseData()
        setupCollectionView()
    }
    func setupCollectionView() {
        searchCollectionView.dataSource
         = self
        let nib = UINib(nibName: "SearchCollCell", bundle: nil)
        searchCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchDataViewModel.arrayListResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollCell", for: indexPath) as? SearchCollCell else {
            return UICollectionViewCell()
        }
        let data = searchDataViewModel.arrayListResult[indexPath.item]
        cell.searchImage.downloaded(from: data.picture.large)
 return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.layer.bounds.width / 2
        let height = collectionView.layer.bounds.height / 4.5
return CGSize(width: width, height: height)
    }

}
