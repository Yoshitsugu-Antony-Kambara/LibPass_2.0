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
    
    
    var getData: [[String]] = [[String]]()
    var nmArray: [Int] = [Int]()
    var currentArray: [String] = ["書名", "著者名", "金額"]
    var stockArray: [[String]] = [[String]]()
    
    @IBOutlet var sumLabel: UILabel!
    @IBOutlet var table: UITableView!
    
    //var bokArray:[[String]] = [[String]]()
    
    var userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sumLabel.text = "0"
        
        table.delegate = self
        table.dataSource = self
        
        self.table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        sumLabel.text = String(sum)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //nmArray.append(Int(currentArray[0])!)
        for i in 0..<getData.count {
            sum += Int(getData[i][0])!
        }
        
        sumLabel.text = String(sum)
        
        stockArray.append(currentArray)
        userDefaults.set(stockArray, forKey: "key")
        getData = userDefaults.array(forKey: "key") as! [[String]]
        
        print(getData)
        //table.reloadData()
    }
    
    
    @IBAction func scanButton() {
        let storyboard = self.storyboard!
        self.present(storyboard.instantiateViewController(withIdentifier: "ScanVC"), animated:true, completion: nil)
    }
}


/*テーブルビューの設定*/
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return getData.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        cell.price.text = self.getData[indexPath.row][0]
        cell.name.text = self.getData[indexPath.row][1]
        cell.auth.text = self.getData[indexPath.row][2]
        
        return cell
    }
}


    

