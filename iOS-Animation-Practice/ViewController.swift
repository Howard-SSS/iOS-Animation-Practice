//
//  ViewController.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/03/31.
//

import UIKit

class ViewController: UIViewController {

    lazy var transformBtn: UIButton = {
        let transformBtn = UIButton(frame: .init(x: 0, y: 200, width: 100, height: 50))
        transformBtn.setTitle("CATransform3D", for: .normal)
        transformBtn.setTitleColor(.black, for: .normal)
        transformBtn.addTarget(self, action: #selector(touchTransformBtn), for: .touchUpInside)
        return transformBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(transformBtn)
    }

    @objc func touchTransformBtn() {
        navigationController?.pushViewController(CATransform3DViewController(), animated: true)
    }
}

