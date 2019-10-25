//
//  AddViewController.swift
//  LibPass_2.0
//
//  Created by 神原良継 on 2019/10/13.
//  Copyright © 2019 jp.Antony. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class AddViewController: UIViewController {
    
    //var bokArray: [[String]] = [[String]]()
    
    var numArray: [Int] = [Int]()
    var ISBN: Int!
    
    var name: String!
    var auth: String!
    var price: Int = 0
    
    var currentArray:[String] = [String]()
    //var bookArray:[[String]] = [[String]]()
    
    @IBOutlet var bookNameLabel: UILabel!   //本の名前を表示
    @IBOutlet var bookAuthLabel: UILabel!   //本の著者を表示
    @IBOutlet var bookPriceLabel: UILabel!  //本の値段を表示
    
    //var userDefaults = UserDefaults.standard    //UDの定義
    
    //var todayBox: Date! //登録日
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getArticles()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    func getArticles() {
        guard let isbn = ISBN else { return }
        
        Alamofire.request("https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404?format=json&isbn=\(isbn)&applicationId=1091598145852090380")
        .responseJSON { (response) in
            print(response.result.value as Any)
            guard let object = response.result.value else {
                return
            }
            
            
            let json = JSON(object)
//            print(json["Items"][0]["Item"]["title"].stringValue)
//            print(json["Items"][0]["Item"]["author"].stringValue)
//            print(json["Items"][0]["Item"]["itemPrice"].intValue)
            
            
            
            self.bookNameLabel.text = json["Items"][0]["Item"]["title"].stringValue
            self.bookAuthLabel.text = json["Items"][0]["Item"]["author"].stringValue
            self.bookPriceLabel.text = String(json["Items"][0]["Item"]["itemPrice"].intValue)

            
//            self.name = json["Items"][0]["Item"]["title"].stringValue
//            self.auth = json["Items"][0]["Item"]["author"].stringValue
            self.price = json["Items"][0]["Item"]["itemPrice"].intValue
//            print(self.name!)
            
//            json.forEach({ (_, json) in
//                json["title"].string
//
//
//                print(json)
//            })
        }
        
        
    }
    
    
    
    @IBAction func addButton() {
        //記帳する(firestoreにデータを送る)
        
//        curentArray[0] = name
//        curentArray[1] = auth
//        curentArray[2] = String(price)
        
        
        //このbookArrayをUDに保存して、セルに表示する
        //bookArray = [curentArray]
        
        //numArray.append(price)
        currentArray.append(bookPriceLabel.text!)
        currentArray.append(bookNameLabel.text!)
        currentArray.append(bookAuthLabel.text!)
        
        
        print(currentArray)
        
        //var getData = userDefaults.array(forKey: "ratio")
        
        //userDefaults.set(bookArray, forKey: "ratio")
        
        //userDefaults.set(numArray, forKey: "num")
        
        
        //curentArray.removeAll()
        
        //var bokArray = userDefaults.object(forKey: "ratio")
        
//        var numArray = userDefaults.integer(forKey: "num")
        
        
//        cell.name.text = self.bookArray[indexPath.row][0]
//        cell.auth.text = self.bookArray[indexPath.row][1]
//        cell.price.text = self.bookArray[indexPath.row][2]
//        cell.date.text = self.bookArray[indexPath.row][3]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.currentArray = self.currentArray
        //vc.numArray = self.numArray
        
    }
    
    
    @IBAction func notButton() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    //struct
    
}
