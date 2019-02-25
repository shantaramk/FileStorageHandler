//
//  ViewController.swift
//  FileStorage
//
//  Created by Shantaram Kokate on 2/25/19.
//  Copyright © 2019 Shantaram Kokate. All rights reserved.
//

import UIKit

class UserInfoModel: Decodable {
    let name: String?
    let place: String?
}

class ViewController: UIViewController {

     static let directory = "UserInfoDirectory.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDict = ["name": "Shantaram Kokate",
                        "place": "India"]
        
        
        //Store file
        
        if !FileStorageHandler.fileExists(ViewController.directory, in: .documents) {
            FileStorageHandler.store(userDict, to: .documents, as: ViewController.directory)
        }
        
        //Retrieve File
        
        if FileStorageHandler.fileExists(ViewController.directory, in: .documents) {
            let infoModel = FileStorageHandler.retrieve(ViewController.directory, from: .documents, as: UserInfoModel.self)
            print(infoModel.name ?? "")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

