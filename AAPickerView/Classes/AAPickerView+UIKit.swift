//
//  AAPickerView+UIKit.swift
//  AAPickerView
//
//  Created by Muhammad Ahsan Ali on 2020/05/05.
//

import UIKit


extension UIView {
    
    @discardableResult
    func aa_addDataPicker(_ placeholder: String, callback: @escaping ((Any) -> ())) -> AAPickerView {
        let picker = AAPickerView()
        picker.text = placeholder
        picker.pickerType = .date
        picker.datePicker?.datePickerMode = .date
        picker.dateFormatter.dateFormat = "dd/MM/YYYY"
        picker.valueDidSelected = callback
        aa_addAndFitSubview(picker, insets: .zero)
        return picker
    }
    
    
    @discardableResult
    func aa_addStringPicker(_ placeholder: String, data: [String], callback: @escaping ((Any) -> ())) -> AAPickerView {
        let picker = AAPickerView()
        picker.text = placeholder
        picker.pickerType = .string(data: data)
        picker.valueDidSelected = callback
        aa_addAndFitSubview(picker, insets: .zero)
        return picker
    }
    
    
}


fileprivate extension UIView {
    func aa_addAndFitSubview(_ subview: UIView, insets: UIEdgeInsets = .zero) {
        addSubview(subview)
        subview.aa_fitInSuperview(with: insets)
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
