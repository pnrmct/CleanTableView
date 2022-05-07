//
//  JsonTableView.swift
//  CleanTableView
//
//  Created by Pınar Macit on 12.04.2022.
//

import UIKit

protocol JsonTableViewProtocol {
    func update(items: [PostModel])
}
protocol JsonTableViewOutput: class {
    func onSelected(items: PostModel)
}
final class JsonTableView: NSObject {
    
    private lazy var items: [PostModel] = []
    
     weak var delegate: JsonTableViewOutput?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].body
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(items: items[indexPath.row])
    }
}
extension JsonTableView: UITableViewDelegate, UITableViewDataSource {
    
}
extension JsonTableView: JsonTableViewProtocol {
    func update(items: [PostModel]) {
        self.items = items
    }
}
