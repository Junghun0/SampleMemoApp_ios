//
//  UserInfoKey.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 19/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation

struct UserInfoKey{
    //저장에 사용할 키
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
}

//계정 및 사용자 정보를 저장 관리하는 클래스
class UserInfoManager{
    
    //연산 프로퍼티 loginId 정의
    var loginId: Int{
        get{
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.loginId)
            ud.synchronize()
        }
    }
    
    var account: String? {
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.account)
            ud.synchronize()
        }
    }
    
    var name: String?{
        get{
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set(v){
            let ud = UserDefaults.standard
            ud.set(v, forKey: UserInfoKey.name)
            ud.synchronize()
        }
    }
    
    var profile: UIImage?{
        get{
            //UIImage 타입은 프로퍼티 리스트에 직접 저장할 수 없어서 Data 타입으로 변환한 다음에 저장!!
            let ud = UserDefaults.standard
            if let _profile = ud.data(forKey: UserInfoKey.profile){
                return UIImage(data: _profile)
            }else{
                return UIImage(named: "account.jpg")
            }
        }
        set(v){
            if v != nil{
                let ud = UserDefaults.standard
                ud.set(v!.pngData(), forKey: UserInfoKey.profile)
                ud.synchronize()
            }
        }
    }
        
    var isLogin: Bool{
        //로그인 아이디가 0이거나 계정이 비어있으면
        if self.loginId == 0 || self.account == nil {
            return false
        }else{
            return true
        }
    }
    
    
    func login(account: String, passwd: String) -> Bool {
        //이 부분은 나중에 서버와 연동
        if account.elementsEqual("test@gmail.com") && passwd.elementsEqual("1234"){
            let ud = UserDefaults.standard
            ud.set(100, forKey: UserInfoKey.loginId)
            ud.set(account, forKey: UserInfoKey.account)
            ud.set("JungHoon Park", forKey: UserInfoKey.name)
            ud.synchronize()
            return true
        }else{
            return false
        }
    }
    
    func logout() -> Bool{
        let ud = UserDefaults.standard
        ud.removeObject(forKey: UserInfoKey.loginId)
        ud.removeObject(forKey: UserInfoKey.account)
        ud.removeObject(forKey: UserInfoKey.name)
        ud.removeObject(forKey: UserInfoKey.profile)
        ud.synchronize()
        return true
    }
}
