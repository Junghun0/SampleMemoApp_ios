//
//  SideBarVC.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 17/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class SideBarVC : UITableViewController{
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()
    
    let uinfo = UserInfoManager() // 개인 정보 관리 매니저
    
    //목록 데이터 배열
    let titles = ["새글 작성하기","친구 새글","달력으로 보기","공지사항","통계","계정 관리"]
    
    //아이콘 데이터 배열
    let icons = [
        UIImage(named: "icon01.png"),
        UIImage(named: "icon02.png"),
        UIImage(named: "icon03.png"),
        UIImage(named: "icon04.png"),
        UIImage(named: "icon05.png"),
        UIImage(named: "icon06.png")
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        self.nameLabel.text = self.uinfo.name ?? "Guest"
        self.emailLabel.text = self.uinfo.account ?? ""
        self.profileImage.image = self.uinfo.profile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //테이블 뷰의 헤더 역할하는 뷰를 추가
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        
        headerView.backgroundColor = UIColor.brown
        
        self.tableView.tableHeaderView = headerView
        
        //이름 레이블의 속성을 정의, 헤더뷰에 추가!
        self.nameLabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.nameLabel.textColor = UIColor.white
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.nameLabel.backgroundColor = UIColor.clear
        
        headerView.addSubview(self.nameLabel)
        
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.textColor = UIColor.white
        self.emailLabel.font = UIFont.boldSystemFont(ofSize: 11)
        self.emailLabel.backgroundColor = UIColor.clear
        
        headerView.addSubview(self.emailLabel)
        
        //기본 이미지를 구현한다.
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        //@@ 이미지 둥글게 커스텀하기!!
        self.profileImage.layer.cornerRadius = (self.profileImage.frame.width/2)
        self.profileImage.layer.borderWidth = 0 //테두리 두께 0으로
        self.profileImage.layer.masksToBounds = true //마스크 효과
        
        view.addSubview(self.profileImage)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell" //테이블 셀 식별자
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            //사이드 바의 메모 작성탭을 클릭하게되면 -> 메모작성하는 화면인 MemoFormVC 로 화면전환을 하는 코드
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm")
            let target = self.revealViewController()?.frontViewController as! UINavigationController
            target.pushViewController(uv!, animated: true)
            
            //화면전환후 사이드바를 닫는다!
            self.revealViewController()?.revealToggle(self)
        }else if indexPath.row == 5{//계정관리->프로필 화면으로 이동!
            let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile")
            self.present(uv!, animated: true){
                //closure 문법으로 present에 세번째 에서 함수실행 -> 화면전환후 자동으로 실행됨![사이드바 닫는 동작]
                self.revealViewController()?.revealToggle(self)
            }
            
        }
        
    }
    
}
