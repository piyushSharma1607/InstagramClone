//
//  DataViewModel.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import Foundation

class DataViewModel: NSObject {
    weak var vc: ViewController?
    weak var searchVC: SearchViewController?
    private var apiService: ApiService!
    var arrayListResult = [Result]()
    
    override init() {
        super.init()
        self.apiService = ApiService.shared
        
    }
    
    func callTheResponseData() {
        self.apiService.getApiResponse {  modelData, err in
            if err != nil {

            } else {
                self.arrayListResult = (modelData!.results)
                DispatchQueue.main.async {
                    self.vc?.instaTableView.reloadData()
                    self.vc?.topCollectionView.reloadData()
                    self.searchVC?.searchCollectionView.reloadData()
                 }
            }
        }
    }
}
