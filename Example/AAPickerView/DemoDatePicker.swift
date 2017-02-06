//
//  DemoDatePicker.swift
//  AAPickerView
//
//  Created by Muhammad Ahsan on 06/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import AAPickerView

class DemoDatePicker: UIViewController {

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
        picker.pickerType = .DatePicker
        
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "dd/MM/YYYY"
        
        picker.dateDidChange = { date in
            print("selectedDate ", date )
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
