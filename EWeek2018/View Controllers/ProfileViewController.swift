//
//  ProfileViewController.swift
//  EWeek2018
//
//  Created by Nav Saini on 12/29/17.
//  Copyright © 2017 SEC. All rights reserved.
//

import UIKit
import QRCode

class ProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var orgTextField: UITextField!
    @IBOutlet weak var QRCodeImageView: UIImageView!
    @IBOutlet weak var generateQRButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orgPickerView = UIPickerView()
        orgPickerView.delegate = self
        orgTextField.inputView = orgPickerView
        orgTextField.text = UserDefaults.standard.string(forKey: "org")

        Configuration.sharedConfig.getConfigsFromFirebase { [weak self] (data: [String]) in
            self?.useData(data: data)
        }
        
        generateQRCode()
    }
    
    private func generateQRCode() {
        let uteid = formatString(data: UserDefaults.standard.string(forKey: "uteid")!)
        let org = formatString(data: UserDefaults.standard.string(forKey: "org")!)
        let name = formatString(data: UserDefaults.standard.string(forKey: "name")!)
        
        // TODO: make domain and port a variable to get from config
        let url = "10.0.0.6:3000/users/success/\(name)/\(uteid)/\(org)"
        
        var qrCode = QRCode(url)
        qrCode?.size = CGSize(width: 300, height: 300)
        QRCodeImageView.image = qrCode?.image
    }
    
    private func formatString(data: String) -> String {
        let formattedString = data.replacingOccurrences(of: " ", with: "%20")
        return formattedString
    }
    
    private func useData(data: [String]) {
        self.orgs = data
    }
    
    @IBAction func onQRButtonPress(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(orgTextField.text, forKey: "org")
        generateQRCode()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
