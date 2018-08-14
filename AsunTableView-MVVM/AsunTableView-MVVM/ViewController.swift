//
//  ViewController.swift
//  AsunTableView-MVVM
//
//  Created by Asun on 2018/8/14.
//  Copyright © 2018年 Asun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let table = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: UITableViewStyle.plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        let vm = AsunViewModel()
        table.delegate = vm
        table.dataSource = vm
        table.register(UITableViewCell.self, forCellReuseIdentifier: "NoValueCell")
        vm.estimatedHeight = UITableViewAutomaticDimension
        vm.rawCount = 10
        vm.cellRender = { index,table in
            let cell = table.dequeueReusableCell(withIdentifier: "NoValueCell")
            return cell
        }
        
        vm.cellSelect = {index,table in
            print(index)
        }
    }
    
    
}

