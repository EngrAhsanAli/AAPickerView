//
//  DemoStringPicker.swift
//  AAPickerView
//
//  Created by Muhammad Ahsan on 06/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AAPickerView

class DemoStringPicker: UIViewController {

    @IBOutlet weak var picker: AAPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPicker()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func configPicker() {

        
        let stringData = ["AVFoundation","Accelerate","AddressBook","AddressBookUI","AssetsLibrary"]

        picker.pickerType = .string(data: stringData)
        picker.heightForRow = 40
        picker.pickerRow.font = UIFont(name: "American Typewriter", size: 30)
        
        picker.toolbar.barTintColor = .darkGray
        picker.toolbar.tintColor = .black
        
        picker.valueDidSelected = { (index) in
            
            print("selectedString ", stringData[index as! Int])
            
        }
        
        picker.valueDidChange = { value in
            print(value)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
