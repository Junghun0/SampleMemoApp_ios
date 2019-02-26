//
//  MemoCell.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 12/02/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet var img: UIImageView!//이미지뷰
    
    @IBOutlet var subject: UILabel!//글의 제목
    
    @IBOutlet var contents: UILabel!//글의 내용
    
    @IBOutlet var regdate: UILabel!// 등록 일자
    
}
