//
//  BasicViewController.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/04/02.
//

import UIKit

class BasicViewController: UIViewController {

    lazy var naviView: UIView = {
        let naviView = UIView(frame: .init(x: 0, y: 0, width: view.width, height: 200))
        naviView.backgroundColor = .clear
        naviView.isUserInteractionEnabled = true
        let underLine = UIView(frame: .init(x: 0, y: naviView.height - 1, width: naviView.width, height: 1))
        underLine.backgroundColor = .gray
        naviView.addSubview(underLine)
        return naviView
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .close)
        backBtn.frame = .init(x: 10, y: 60, width: 40, height: 40)
        backBtn.addTarget(self, action: #selector(touchBackBtn), for: .touchUpInside)
        backBtn.tintColor = .blue
        return backBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(naviView)
        naviView.addSubview(backBtn)
    }
    
    @objc func touchBackBtn() {
        navigationController?.popViewController(animated: true)
    }
}
