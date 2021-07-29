//
//  BaseViewController.swift
//  RoversApp
//
//  Created by Tutku on 27.07.2021.
//

import Foundation
import UIKit

protocol BaseViewControllerDelegate {
    func selectedCameraType(name: String)
}

class BaseViewController: UIViewController {
    var filterPickerView = UIPickerView()
    let picketTextField = UITextField(frame: .zero)
    let toolBar = UIToolbar()
    var cameraNames = [String]()
    var selectedCamera: String?
    var delegate: BaseViewControllerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
        addNavigationBarButton()
        pickerViewAddToolbar()
    }
    
     func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func controller(title: RoverType) {
        switch title {
        case .Curiosity:
            cameraNames = ["ALL","FHAZ", "RHAZ","MAST","CHEMCAM","MAHLI","MARDI","NAVCAM"]
        case .Opportunity:
            cameraNames = ["ALL","FHAZ", "RHAZ","NAVCAM","PANCAM","MINITES"]
        case .Spirit:
            cameraNames = ["ALL","FHAZ", "RHAZ","NAVCAM","PANCAM","MINITES"]
        }
    }
    
    public func addNavigationBarButton(){
        var image = UIImage(named: "filterIcon")
        image = image?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(filterButtonTapped))
    }
    
    @objc public func filterButtonTapped() {
        view.addSubview(picketTextField)
        picketTextField.inputView = filterPickerView
        picketTextField.inputAccessoryView = toolBar
        picketTextField.becomeFirstResponder()
    }
        
    private func pickerViewAddToolbar() {
        toolBar.sizeToFit()
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([closeButton,spaceButton], animated: false)
    }
    
    @objc func closeButtonTapped() {
        view.endEditing(true)
    }
    
}

//MARK: UIPickerViewDelegateAndDataSource
extension BaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCamera = cameraNames[row]
        if selectedCamera == "ALL" {
            selectedCamera = ""
        }
        delegate?.selectedCameraType(name: selectedCamera ?? "")
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
