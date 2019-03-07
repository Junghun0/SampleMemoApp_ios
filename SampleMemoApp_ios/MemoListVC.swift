//
//  MemoListVC.swift
//  SampleMemoApp_ios
//
//  Created by 박정훈 on 12/02/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {

    //앱 델리게이트 객체의 참조 정보를 읽어온다.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //디바이스 스크린에 뷰 컨트롤러가 나타날 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        //테이블 데이터를 다시 읽어들인다. 이에 따라 행을 구성하는 로직이 다시 실행될 것!
        self.tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = self.appDelegate.memolist.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. memoList 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        //2. 이미지 속성이 비어있을 경우 "memoCell", 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        //3. 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        //4. memoCell 의 내용을 구성.
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        //5. Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경한다.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        //6. cell 객체를 리턴
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            print("index path of delete: \(indexPath)")
            completionHandler(true)
        }
        
        let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            print("index path of edit: \(indexPath)")
            completionHandler(true)
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        return swipeActionConfig
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//            var data = self.appDelegate.memolist
//
//                data.remove(at: indexPath.row)
//
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .none)
//            tableView.endUpdates()
//        }
//    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //테이블 뷰 셀 클릭 해제될때 불림-> 이전클릭셀데이터 전달함
   /* override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //1. memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
    
        print(indexPath.index(after: indexPath.row))
        
        print(indexPath.startIndex)
        print(row)
        
        //2. 상세 화면의 인스턴스를 생성한다.
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        //3. 값을 전달한 다음, 상세 화면으로 이동한다.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. memolist 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        //2. 상세 화면의 인스턴스를 생성한다.
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            return
        }
        //3. 값을 전달한 다음, 상세 화면으로 이동한다.
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
