//
//  AAPickerView+UIKit.swift
//  AAPickerView
//
//  Created by Muhammad Ahsan Ali on 2020/05/06.
//

import UIKit

// MARK:- UIView extensions to add and fit quickly in some view
@available(iOS 9.0, *)
public extension UIView {
    
    @discardableResult
    func aa_addDataPicker(_ placeholder: String, _ insets: UIEdgeInsets = .zero, callback: @escaping ((Any) -> ())) -> UITextField {
        aa_removeSubViews()
        let picker = AAPickerView()
        picker.placeholder = placeholder
        picker.textAlignment = .center
        picker.pickerType = .date
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "dd/MM/YYYY"
        picker.valueDidSelected = callback
        picker.sizeToFit()
        aa_addConstrainedSubview(picker)
        return picker
    }
    
     @discardableResult
      func aa_addStringPicker(_ placeholder: String, data: [String], _ insets: UIEdgeInsets = .zero, callback: @escaping ((Any) -> ())) -> UITextField {
        aa_removeSubViews()
        let picker = AAPickerView()
        picker.placeholder = placeholder
        picker.textAlignment = .center
        picker.pickerType = .string(data: data)
        picker.valueDidSelected  = {
            picker.placeholder = nil
            callback($0)
        }
        picker.sizeToFit()
        aa_addConstrainedSubview(picker)
        return picker
        
      }
      
    
}

// MARK:- UIView private extensions
fileprivate extension UIView {
    
    func aa_removeSubViews() {
        guard self.subviews.count > 0 else {
            return
        }
        self.subviews.forEach {$0.removeFromSuperview()}
    }
    
    
    @available(iOS 9.0, *)
    func aa_addConstrainedSubview(_ subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
