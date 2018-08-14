//
//  AsunTableView.swift
//  TIps
//
//  Created by Asun on 2018/8/13.
//  Copyright © 2018年 Asun. All rights reserved.
//

import UIKit

typealias AsunCell = UITableViewCell
typealias AsunTable = UITableView

typealias AsunCellRenderBlock = (_ indexPath:IndexPath,_ tableView:AsunTable) -> AsunCell?
typealias AsunCellSelectBlock = (_ indexPath:IndexPath,_ tableview:AsunTable) -> Void

class AsunViewModel:NSObject,UITableViewDataSource,UITableViewDelegate {
    
    var cellRender: AsunCellRenderBlock! //Cell
    var cellSelect: AsunCellSelectBlock! //Cell点击
    var cellHeight:CGFloat = UITableView.automaticDimension //RowHeight
    var estimatedHeight:CGFloat = 50 //预估行高
    var sectionCount:Int = 0 //组
    var rawCount: Int = 0 //行
    /*  === DataSource ===   */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rawCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellRender(indexPath,tableView)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectBlock = cellSelect else{
            print("cell的选中block没有实例")
            return
        }
        selectBlock(indexPath,tableView)
    }
}

