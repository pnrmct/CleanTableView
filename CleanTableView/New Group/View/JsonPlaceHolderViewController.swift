//
//  JsonPlaceHolderViewController.swift
//  CleanTableView
//
//  Created by Pınar Macit on 12.04.2022.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController {

    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!
    
    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService:JsonPlaceHolderProtocol = JsonPlaceHolderService()
    override func viewDidLoad() {
        super.viewDidLoad()
        initService()
        initDelegate()
        
    }
   private func initDelegate() {
        tableViewJsonPlaceHolder.delegate = jsonTableView
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        jsonTableView.delegate = self
        
    }
   private func initService() {
        jsonService.fethAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()
            
        } onFail: { data in
            print(data ?? "")
        }
    }
    
}

extension JsonPlaceHolderViewController : JsonTableViewOutput {
    func onSelected(items: PostModel) {
        print(items.body ?? "")
    }
}
