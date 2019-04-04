//
//  Utils.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 04/04/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation

extension UIViewController{
    var tutorialSB: UIStoryboard{
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }//Tutorial 파일을 객체로 불러오기 위한 프로퍼티
    
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }//정의된 컨트롤러의 인스턴스를 생성하는 메소드
}
