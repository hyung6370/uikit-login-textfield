//
//  ViewController.swift
//  TextFieldProject
//
//  Created by KIM Hyung Jun on 2023/06/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        // 내부의 대리자를 self(viewController)로 설정
        
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        
        // First응답객체를 textfield로 설정 만들어준다! -> 실행되자마자 키보드가 올라온다!
        textField.becomeFirstResponder()
    }
    
    // 여백 눌렀을 때 키보드 내리게 // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // text.resignFirstResponder()
    }
    
    // textfield의 입력을 시작할 때 호출 (editing을 시작하는 걸 허락할지 말지)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점 - 텍스트필드를 쓰려고 터치한 순간
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 깔끔하게 없애는 걸 허락할지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 글자 내용이 (한글자 판글자) 입력되거나 지워질 때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // print(#function)
        // print(string)
        
//        let maxLength = 10
//        let currnetString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString =
//                currnetString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
        if Int(string) != nil {
            return false
        }
        else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할건지 말건지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        }
        else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 끝냈다.")
        textField.text = ""
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 키보드 내리게 한다.
        textField.resignFirstResponder()
        
    }
    
}

