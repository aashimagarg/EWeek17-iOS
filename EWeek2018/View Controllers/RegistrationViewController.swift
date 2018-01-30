//
//  RegistrationViewController.swift
//  EWeek2018
//
//  Created by Aashima Garg on 12/26/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var uteidTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var orgTextField: UITextField!
    
    var orgs: [String]?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return orgs!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return orgs?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        orgTextField.text = orgs?[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return nameTextField.text != "" && checkUTEID() && orgTextField.text != ""
    }
    
    // TODO: add more logic
    private func checkUTEID() -> Bool {
        return uteidTextField.text != "" && true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 4
        let orgPickerView = UIPickerView()
        orgPickerView.delegate = self
        orgTextField.inputView = orgPickerView
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginButton.layer.shadowRadius = 5
        loginButton.layer.shadowOpacity = 0.8
        Configuration.sharedConfig.getConfigsFromFirebase { [weak self] (data: [String]) in
            self?.useData(data: data)
        }
    }
    
    private func useData(data: [String]) {
        print(data)
        self.orgs = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "name")
        defaults.set(orgTextField.text, forKey: "org")
        defaults.set(uteidTextField.text, forKey: "uteid")
    }
 

}

