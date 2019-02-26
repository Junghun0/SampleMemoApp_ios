//
//  MemoFormVC.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 12/02/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    var subject: String!

    @IBOutlet var preview: UIImageView!
    @IBOutlet var contents: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self

    }
    
    //저장 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func save(_ sender: Any) {
        //1.내용을 입력하지않고 저장할경우, 경고!
        guard self.contents.text?.isEmpty == false else{
            //내용이 비어있을경우
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        //2. MemoData 객체를 생성하고, 데이터를 저장한다.
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        
        //3.앱 델리게이트 객체를 읽어온 다음 , memoList 배열에 MemoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //4.작성폼 화면을 종료하고, 이전화면으로 돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    //카메라 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func pick(_ sender: Any) {
        //이미지 피커 인스턴스를 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        //이미지 피커 화면을 표시
        self.present(picker, animated: false, completion: nil)
    }
    
    //이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택된 이미지를 미리보기에 표시한다.
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
    }

    
    func textViewDidChange(_ textView: UITextView){
        // 내용의 최대 15자리까지 읽어 subject 변수에 저장한다.
        let contents = textView.text as NSString
        let length = ( (contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        // 내비게이션 타이틀에 표시한다.
        self.navigationItem.title = subject
    }
    
}
