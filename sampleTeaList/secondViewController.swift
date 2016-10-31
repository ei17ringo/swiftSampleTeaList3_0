//
//  secondViewController.swift
//  sampleTeaList
//
//  Created by Eriko Ichinohe on 2016/02/10.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var scSelectedIndex = -1

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myDescription: UITextView!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //-- json.txtファイルを読み込んで
        let path = Bundle.main.path(forResource: "json", ofType: "txt")
        let jsondata = try? Data(contentsOf: URL(fileURLWithPath: path!))
        //-- 辞書データに変換して
        let jsonArray = (try! JSONSerialization.jsonObject(with: jsondata!, options: [])) as! NSArray
        
        let dic:NSDictionary = jsonArray[scSelectedIndex] as! NSDictionary
        
        myLabel.text = dic["name"] as! String
        myDescription.text = dic["description"] as! String
        myImageView.image = UIImage(named: dic["image"] as! String)
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
