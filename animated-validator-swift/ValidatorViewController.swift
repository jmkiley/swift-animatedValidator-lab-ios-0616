//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

// Need to do constraints

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    var emailIsValid = Bool()
    var emailConfirmationIsValid = Bool()
    var numberIsValid = Bool()
    var passwordConfirmationIsValid = Bool()
    var passwordIsValid = Bool()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.enabled = false
        setupDelegates()
    }
    
    func setupDelegates() {
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        let textFieldCount = textField.text?.characters.count
        let validEmail = textField.text?.containsString("@")
        let numbers = NSCharacterSet.decimalDigitCharacterSet()
        //        let phoneNumberCount = textField.text?.characters.count = 7
        let phoneNumberOnlyNumbers = textField.text?.rangeOfCharacterFromSet(numbers)
        
        
        switch textField {
        case textField == emailTextField && textFieldCount > 0 && validEmail!:
            print(textField)
            self.emailIsValid = true
            textField.backgroundColor = UIColor.whiteColor()
        case textField == emailConfirmationTextField && textField.text == emailTextField.text :
            print(textField)
            self.emailConfirmationIsValid = true
            textField.backgroundColor = UIColor.whiteColor()
        case textField == phoneTextField && textFieldCount >= 7 && phoneNumberOnlyNumbers!.count == textFieldCount :
            print(textField)
            self.numberIsValid = true
            textField.backgroundColor = UIColor.whiteColor()
        //            return true
        case textField == passwordTextField && textFieldCount >= 6 :
            print(textField)
            self.passwordIsValid = true
            textField.backgroundColor = UIColor.whiteColor()
        //            return true
        case textField == passwordConfirmTextField && textField.text == passwordTextField.text :
            print(textField)
            self.passwordConfirmationIsValid = true
            textField.backgroundColor = UIColor.whiteColor()
        //            return true
        default:
            animateInvalidTextField(textField)
            print("Nope")
            //            return false
            break
        }
        
        if self.emailIsValid && self.emailConfirmationIsValid && self.numberIsValid && self.passwordConfirmationIsValid && self.passwordIsValid {
            submitButton.enabled = true
            print("YAY!")
        }
    }
    
    func animateInvalidTextField(textField: UITextField) {
        UIView.animateWithDuration(0.2, animations: {
            UIView.setAnimationRepeatCount(3.0)
            textField.backgroundColor = UIColor.redColor()
            textField.transform = CGAffineTransformMakeScale(0.80, 0.80)
            self.view.layoutIfNeeded()
        })
    }
}