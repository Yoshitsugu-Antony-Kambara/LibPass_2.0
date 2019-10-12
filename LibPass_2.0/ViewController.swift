//
//  ViewController.swift
//  LibPass_2.0
//
//  Created by 神原良継 on 2019/10/13.
//  Copyright © 2019 jp.Antony. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var sumLabel: UILabel!
    @IBOutlet var table: UITableView!
    
    var bookArray:[[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        self.table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    
    @IBAction func scanButton() {
        self.present(ScanViewController(), animated: true, completion: nil)
        
        
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        
        cell.name.text = self.bookArray[indexPath.row][0]
        cell.auth.text = self.bookArray[indexPath.row][1]
        cell.price.text = self.bookArray[indexPath.row][2]
        cell.date.text = self.bookArray[indexPath.row][3]
        
        
        
        return cell
    }
    
    
    
    
    
    
    
}
