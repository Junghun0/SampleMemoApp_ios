//
//  MemoData.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 12/02/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class MemoData{
    var memoIdx: Int? //데이터 식별값
    var title: String? //메모 제목
    var contents: String? // 메모 내용
    var image: UIImage? //이미지
    var regdate : Date? //작성일
}
