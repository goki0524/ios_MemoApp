//
//  MemoViewController.swift
//  MyMemoApp
//
//  Created by 坂口豪紀 on 2018/06/19.
//  Copyright © 2018年 坂口豪紀. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    var memo: String?
    
    @IBOutlet weak var memoTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = false
        if let memo = self.memo{
            self.memoTextField.text = memo
            self.navigationItem.title = "Edit Memo"
        }
        self.updateSaveButtonState()
    }

    private func updateSaveButtonState(){
        let memo = self.memoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    @IBAction func memoTextFieldChanged(_ sender: Any) {
        self.updateSaveButtonState()
    }
    
    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else{
            return
        }
        self.memo = self.memoTextField.text ?? ""        
    }

}
