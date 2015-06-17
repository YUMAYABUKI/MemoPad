//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 矢吹祐真 on 2015/06/17.
//  Copyright (c) 2015年 矢吹祐真. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController ,UITextFieldDelegate {
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField.text = saveData.objectForKey("title") as! String?
        contentTextView.text=saveData.objectForKey("content") as! String?
        
        titleTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMemo(){
         NSLog("save")
        saveData.setObject(titleTextField.text,forKey:"title")
        saveData.setObject(contentTextView.text, forKey: "content")
        saveData.synchronize()
       
        
        //alert
        let alert = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: {action in
            NSLog("okボタンが押されました")
            }
            )
        )
        
        presentViewController(alert, animated: true,completion: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
