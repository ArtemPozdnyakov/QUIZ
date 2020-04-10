//
//  RecordsTableViewController.swift
//  MillionairGame
//
//  Created by admin on 4/10/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

class RecordsTableViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }


}
extension RecordsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        let record = Game.shared.results[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.textLabel?.text = "\(dateFormatter.string(from: record.date)): \(record.score) score"
        return cell
    }
}
