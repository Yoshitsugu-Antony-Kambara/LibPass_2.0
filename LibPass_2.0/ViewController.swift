//
//  ViewController.swift
//  LibPass_2.0
//
//  Created by 神原良継 on 2019/10/13.
//  Copyright © 2019 jp.Antony. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var sum: Int = 0
    
    
    var nmArray: [Int] = [Int]()
    
    @IBOutlet var sumLabel: UILabel!
    @IBOutlet var table: UITableView!
    
    var bokArray:[[String]] = [[String]]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumLabel.text = "0"
        
        table.delegate = self
        table.dataSource = self
        
        self.table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        sumLabel.text = String(sum)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0..<nmArray.count {
            sum = sum + nmArray[i]
        }
        sumLabel.text = String(sum)
    }
    
    
    @IBAction func scanButton() {
        let storyboard = self.storyboard!
        self.present(storyboard.instantiateViewController(withIdentifier: "ScanVC"), animated:true, completion: nil)
    }
}


/*テーブルビューの設定*/
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return nmArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.price.text = String(self.nmArray[indexPath.row])
        
        return cell
    }
}


    

