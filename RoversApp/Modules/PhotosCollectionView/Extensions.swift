//
//  Extensions.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation
import UIKit

protocol BaseViewControllerDelegate {
    func selectedCam(select: String)
}

class BaseViewController: UIViewController {
    var filterPickerView = UIPickerView()
    let picketTextField = UITextField(frame: .zero)
    let toolBar = UIToolbar()
    var cameraNames = [String]()
    var selectedCam: String?
    var delegate: BaseViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
        addNavigationBarButton(imageName: "house", direction: .right)
        pickerViewAddToolbar()
    }
    
    func camessss(type: RoverType) {
        switch type {
        case .Curiosity:
            cameraNames = ["FHAZ", "RHAZ","MAST","CHEMCAM","MAHLI","MARDI","NAVCAM"]
        case .Opportunity:
            cameraNames = ["FHAZ", "RHAZ","NAVCAM","PANCAM","MINITES"]
        case .Spirit:
            cameraNames = ["FHAZ", "RHAZ","NAVCAM","PANCAM","MINITES"]
        }
    }
    
    public func addNavigationBarButton(imageName:String,direction:direction){
        var image = UIImage(systemName: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        switch direction {
        case .left:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(goBack))
        case .right:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(goBack))
        }
    }
    
    @objc public func goBack() {
        view.addSubview(picketTextField)
        picketTextField.inputView = filterPickerView
        picketTextField.inputAccessoryView = toolBar
        picketTextField.becomeFirstResponder()
    }
        
    private func pickerViewAddToolbar() {
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(doneButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton,doneButton], animated: false)
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    public enum direction {
        case right
        case left
    }
}

//MARK: UIPickerViewDelegateAndDataSource
extension BaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.selectedCam(select: cameraNames[row])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cameraNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cameraNames[row]
    }
}

enum RoverType: String {
    case Curiosity = "Curiosity"
    case Opportunity = "Opportunity"
    case Spirit = "Spirit"
}
