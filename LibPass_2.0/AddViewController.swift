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
    
    var ISBN: Int = 9784479793007
    @IBOutlet var bookNameLabel: UILabel!   //本の名前を表示
    @IBOutlet var bookAuthLabel: UILabel!   //本の著者を表示
    @IBOutlet var bookPriceLabel: UILabel!  //本の値段を表示
    
    //var todayBox: Date! //登録日
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("fuuuuuuuuuuuuuuuuuuuuuuuuuuck")
        // Do any additional setup after loading the view.
        //getArticles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("chinko")
    }
    
    
    func getArticles() {
        
        Alamofire.request("ここだよー")
        .responseJSON { (response) in
            print(response.result.value as Any)
            guard let object = response.result.value else {
                return
            }
            
            
            let json = JSON(object)
            json.forEach({ (_, json) in
                //json["title"].string
                
                
                print(json["count"].int as Any)
            })
        }
        
        
    }
    
    
    
    @IBAction func addButton() {
        //記帳する(firestoreにデータを送る)
        
    }
    
    
    @IBAction func notButton() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
