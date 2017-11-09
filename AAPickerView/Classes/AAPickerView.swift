//
//  AAPickerView.swift
//  AAPickerView
//
//  Created by Engr. Ahsan Ali on 01/06/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

/// MARK:- AAPickerView
open class AAPickerView: UITextField {
    
    open var pickerType: AAPickerType? {
        
        didSet {
            guard let type = pickerType else {
                return
            }
            
            switch type {
            case .DatePicker:
                datePicker = UIDatePicker()
                break
            case .StringPicker:
                stringPicker = UIPickerView()
                break
            }
            
            inputAccessoryView = toolbar
        }
    }
    
    // For DatePicker
    open var dateFormatter = DateFormatter()
    open var dateDidChange: ((Date) -> Void)?
    
    open var datePicker: UIDatePicker? {
        get {
            return self.inputView as? UIDatePicker
        }
        set {
            inputView = newValue
            dateFormatter.dateFormat = "MM/dd/YYYY"
            
        }
    }
    
    // For String Picker
    
    open var stringPickerData: [String]?
    open var stringDidChange: ((Int) -> Void)?
    
    open var pickerRow: UILabel {
        let pickerLabel = UILabel()
        pickerLabel.textColor = .black
        pickerLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        pickerLabel.textAlignment = .center
        pickerLabel.sizeToFit()
        return pickerLabel
    }

    open var stringPicker: UIPickerView? {
        get {
            return self.inputView as? UIPickerView
        }
        set(picker) {
            print("picker ", picker)
            picker?.delegate = self
            inputView = picker
        }
    }
    

    // Configurations

    open var toolbar: UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(AAPickerView.doneAction))

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                           target: self,
                                           action: #selector(AAPickerView.cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        inputAccessoryView = toolBar
        return toolBar
    }

    @objc func doneAction() {
        
        guard let type = pickerType else {
            return
        }
        
        switch type {
        case .DatePicker:
            
            let date = datePicker!.date
            self.text = dateFormatter.string(from: date)
            
            dateDidChange?(date)
            
            break
        case .StringPicker:
            let row = stringPicker!.selectedRow(inComponent: 0)
            self.text = stringPickerData![row]
            
            stringDidChange?(row)
            
            break
            
        }
        
        resignFirstResponder()
    }
    
    @objc func cancelAction() {
        resignFirstResponder()
    }
    
    
}



