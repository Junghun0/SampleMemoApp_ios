//
//  CSLogButton.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 14/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

public enum  CSLogType: Int{
    case basic //기본 로그 타입
    case title //버튼의 타이틀을 출력
    case tag //버튼의 태그값을 출력
}


public class CSLogBubtton: UIButton{
    //로그 출력 타입
    public var logType: CSLogType = .basic
    
    //로그를 출력하는 액션 메소드
    @objc func logging(_ sender: UIButton){
        switch self.logType {
        case .basic:
            NSLog("버튼이 클릭되었습니다.")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "타이틀 없는"
            NSLog("\(btnTitle) 버튼이 클릭되었습니다.")
        case .tag:
            NSLog("\(sender.tag) 버튼이 클릭되었습니다.")
        }
    }
    
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        //버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = UIColor.white
        
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
}


