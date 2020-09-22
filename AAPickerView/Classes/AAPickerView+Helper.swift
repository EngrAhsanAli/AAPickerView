//
//  AAPickerView+Helper.swift
//  AAPickerView
//
//  Created by Engr. Ahsan Ali on 04/02/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

let AA_TAG = "AAPickerView:- "

/// Picker View type
///
/// - StringPicker: string picker
/// - DatePicker: date picker
public enum AAPickerType {
    case string(data: [String])
    case date
}

public func ==(lhs: AAPickerType, rhs: AAPickerType) -> Bool {
    switch (lhs, rhs) {
    case let (.string(a), .string(b)):
        return a == b
    case (.date, .date):
        return true
    default:
        return false
    }
}

public func !=(lhs: AAPickerType, rhs: AAPickerType) -> Bool {
    return !(lhs == rhs)
}

//MARK: UIPickerViewDelegate
extension AAPickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringPickerData.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    open func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = pickerRow
        label.text = stringPickerData[row]
        return label
    }

    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return heightForRow
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueDidChange?(row)
        sendActions(for: .valueChanged)
    }
    
}
