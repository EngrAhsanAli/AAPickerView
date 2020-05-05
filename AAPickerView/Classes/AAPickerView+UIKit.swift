//
//  AAPickerView+UIKit.swift
//  AAPickerView
//
//  Created by Muhammad Ahsan Ali on 2020/05/06.
//

import UIKit

// MARK:- UIView extensions to add and fit quickly in some view
public extension UIView {
    
    @discardableResult
    func aa_addDataPicker(_ placeholder: String, _ insets: UIEdgeInsets = .zero, callback: @escaping ((Any) -> ())) -> UITextField {
        aa_removeSubViews()
        let picker = AAPickerView()
        picker.placeholder = placeholder
        picker.pickerType = .date
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "dd/MM/YYYY"
        picker.valueDidSelected = callback
        picker.toolbar.barStyle = .black
        addSubview(picker)
        aa_fitInSuperview(with: insets)
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
        addSubview(picker)
        aa_fitInSuperview(with: insets)
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
    
    func aa_fitInSuperview(with insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            assertionFailure("\(AA_TAG) fitInSuperview was called but view was not in a view hierarchy.")
            return
        }

        let applyInset: (NSLayoutConstraint.Attribute, UIEdgeInsets) -> CGFloat = {
            switch $0 {
            case .top: return $1.top
            case .bottom: return -$1.bottom
            case .left: return $1.left
            case .right: return -$1.right
            default:
                return 0
            }
        }

        translatesAutoresizingMaskIntoConstraints = false

        let attributes = [NSLayoutConstraint.Attribute.top, .left, .right, .bottom]
        superview.addConstraints(attributes.map {
            return NSLayoutConstraint(item: self,
                                      attribute: $0,
                                      relatedBy: .equal,
                                      toItem: superview,
                                      attribute: $0,
                                      multiplier: 1,
                                      constant: applyInset($0, insets))
        })
    }
}
