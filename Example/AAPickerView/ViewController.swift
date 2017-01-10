//
//  ViewController.swift
//  AAPickerView
//
//  Created by Engr. Ahsan Ali on 01/06/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import AAPickerView

class ViewController: UIViewController {
    
    @IBOutlet weak var picker1: AAPickerView!
    @IBOutlet weak var picker2: AAPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
/////////////////////////////////////////////////////////////////////////////////////////////////////
        
//                               AAPickerView - String Picker
        
/////////////////////////////////////////////////////////////////////////////////////////////////////
        
        picker1.pickerType = .StringPicker
        
        let stringData = ["AVFoundation","Accelerate","AddressBook","AddressBookUI","AssetsLibrary"]
        picker1.stringPickerData = stringData
        picker1.pickerRow.font = UIFont(name: "American Typewriter", size: 30)
        
        picker1.toolbar.barTintColor = .darkGray
        picker1.toolbar.tintColor = .black
        
        picker1.stringDidChange = { index in
            
            print("selectedString ", stringData[index])


        }
        
/////////////////////////////////////////////////////////////////////////////////////////////////////
        
//                               AAPickerView - Date Picker
        
/////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        picker2.pickerType = .DatePicker
        
        picker2.datePicker?.datePickerMode = .date
        picker2.dateFormatter.dateFormat = "dd/MM/YYYY"
        
        picker2.dateDidChange = { date in
            print("selectedDate ", date )
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
