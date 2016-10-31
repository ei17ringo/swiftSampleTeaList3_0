//
//  ViewController.swift
//  sampleTeaList
//
//  Created by Eriko Ichinohe on 2016/02/10.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var teaListTableView: UITableView!

    var tea_list:[NSDictionary] = []
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //-- json.txtファイルを読み込んで
        let path = Bundle.main.path(forResource: "json", ofType: "txt")
        let jsondata = try? Data(contentsOf: URL(fileURLWithPath: path!))
        //-- 辞書データに変換して
        let jsonArray = (try! JSONSerialization.jsonObject(with: jsondata!, options: [])) as! NSArray
        //--  辞書データの個数だけ繰り返して表示する
        for data in jsonArray {
            var dicForData:NSDictionary = data as! NSDictionary
            
            print("[\(dicForData["name"])]")
            tea_list.append(data as! NSDictionary)
        }
    }

    // 行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tea_list.count
    }
    
    // 表示するセルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        //cell.textLabel!.text = "\(indexPath.row)行目"
        
        //文字色を茶色にする
        cell.textLabel?.textColor = UIColor.brown
        //矢印を右側につける
        cell.accessoryType = .disclosureIndicator
        
        let teaName = tea_list[(indexPath as NSIndexPath).row]["name"] as! String
        
        cell.textLabel!.text = "\(teaName)"
        return cell
        
    }
    
    // 選択された時に行う処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((indexPath as NSIndexPath).row)行目を選択")
        selectedIndex = (indexPath as NSIndexPath).row
        performSegue(withIdentifier: "showSecondView",sender: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Segueで画面遷移する時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! secondViewController
        
        secondVC.scSelectedIndex = selectedIndex
    }

}

