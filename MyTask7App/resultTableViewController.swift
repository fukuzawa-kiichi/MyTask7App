//
//  resultTableViewController.swift
//  MyTask7App
//
//  Created by VERTEX24 on 2019/08/12.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class resultTableViewController: UITableViewController {

    // 正解した問題名を入れる箱
    var result: [Bool] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if result[indexPath.row] {
            cell.textLabel?.text = "第\(indexPath.row + 1)問目 ◯"
        }else{
            cell.textLabel?.text = "第\(indexPath.row + 1)問目 ✕"

        }
        
        return cell
    }
    

   
}
