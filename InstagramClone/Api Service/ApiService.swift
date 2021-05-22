//
//  ApiService.swift
//  InstagramClone
//
//  Created by Piyush Sharma on 22/05/21.
//

import Foundation

let baseURL = "https://randomuser.me/api/?results=300"
let finalUrl = URL(string: baseURL)

class ApiService {
    //MARK: - Properties
    static let shared = ApiService()
    weak var vc: ViewController?
    var dataModel = [Result]()

    
    func getApiResponse(completion: @escaping(UserModel?, Error?) -> Void){
        if let url = finalUrl {

            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let data = data {
//                        print(String(data:data, encoding: .utf8))
//                        print(response)
                        do{
                            if let response = try? JSONDecoder().decode(UserModel.self, from: data) {
                                self.dataModel = response.results
                                DispatchQueue.main.async {
                                    self.vc?.instaTableView.reloadData()
                                    self.vc?.topCollectionView.reloadData()
                                }
                                completion(response, error)
                            }
//                        } catch let err {
//                            print(err.localizedDescription)
                        }
                    }
                }
            }.resume()



    }
    }
    
    
    
}
