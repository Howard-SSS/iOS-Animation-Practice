//
//  ViewController.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/03/31.
//

import UIKit

class ViewController: UIViewController {

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: view.bounds)
        stackView.addArrangedSubview(transformBtn)
        stackView.addArrangedSubview(replicatorBtn)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var transformBtn: UIButton = {
        let transformBtn = UIButton(frame: .init(x: 0, y: 200, width: 100, height: 50))
        transformBtn.setTitle("CATransform3D", for: .normal)
        transformBtn.setTitleColor(.black, for: .normal)
        transformBtn.addTarget(self, action: #selector(touchTransformBtn), for: .touchUpInside)
        return transformBtn
    }()
    
    lazy var replicatorBtn: UIButton = {
        let replicatorBtn = UIButton(frame: .init(x: 0, y: 0, width: 100, height: 50))
        replicatorBtn.setTitle("CAReplicatorLayer", for: .normal)
        replicatorBtn.setTitleColor(.black, for: .normal)
        replicatorBtn.addTarget(self, action: #selector(touchReplicatorBtn), for: .touchUpInside)
        return replicatorBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
    }

    @objc func touchTransformBtn() {
        navigationController?.pushViewController(TransformViewController(), animated: true)
    }
    
    @objc func touchReplicatorBtn() {
        navigationController?.pushViewController(ReplicatorViewController(), animated: true)
    }
}

