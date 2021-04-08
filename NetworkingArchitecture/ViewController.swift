//
//  ViewController.swift
//  NetworkingArchitecture
//
//  Created by Tashreque Mohammed Haq on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkManager.request(endpoint: NewsEndpoint.getTopHeadlines(country: "us", page: 1)) { (result: Result<News, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print(response)
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }


}

