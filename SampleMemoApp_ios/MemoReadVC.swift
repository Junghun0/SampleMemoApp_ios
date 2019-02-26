//
//  MemoReadVC.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 12/02/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    //콘텐츠 데이터를 저장하는 변수
    var param : MemoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.제목과 내용, 이미지를 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 2.날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm 분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // 3.내비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dateString

        // Do any additional setup after loading the view.
    }
}
