//
//  CATransform3DViewController.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/03/31.
//

import UIKit

class CATransform3DViewController: UIViewController {

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
    
    lazy var cube: CATransformLayer = {
        let cube = CATransformLayer()
        cube.frame = view.bounds
        return cube
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGesture)))
        view.addSubview(naviView)
        naviView.addSubview(backBtn)
        
        let layerFrame: CGRect = .init(x: (view.width - 100) * 0.5, y: (view.height - 100) * 0.5, width: 100, height: 100)
        let f1 = CATransform3DMakeTranslation(0, 0, 50)
        let c1 = CALayer()
        c1.backgroundColor = UIColor.red.cgColor
        c1.frame = layerFrame
        c1.transform = f1
        cube.addSublayer(c1)
        
        var f2 = CATransform3DMakeTranslation(50, 0, 0)
        f2 = CATransform3DRotate(f2, Double.pi * 0.5, 0, 1, 0)
        let c2 = CALayer()
        c2.backgroundColor = UIColor.orange.cgColor
        c2.frame = layerFrame
        c2.transform = f2
        cube.addSublayer(c2)
        
        let f3 = CATransform3DMakeTranslation(0, 0, -50)
        let c3 = CALayer()
        c3.backgroundColor = UIColor.blue.cgColor
        c3.frame = layerFrame
        c3.transform = f3
        cube.addSublayer(c3)
        
        var f4 = CATransform3DMakeTranslation(-50, 0, 0)
        f4 = CATransform3DRotate(f4, Double.pi * 0.5, 0, 1, 0)
        let c4 = CALayer()
        c4.backgroundColor = UIColor.green.cgColor
        c4.frame = layerFrame
        c4.transform = f4
        cube.addSublayer(c4)
        
        var f5 = CATransform3DMakeTranslation(0, 50, 0)
        f5 = CATransform3DRotate(f5, Double.pi * 0.5, 1, 0, 0)
        let c5 = CALayer()
        c5.backgroundColor = UIColor.gray.cgColor
        c5.frame = layerFrame
        c5.transform = f5
        cube.addSublayer(c5)
        
        var f6 = CATransform3DMakeTranslation(0, -50, 0)
        f6 = CATransform3DRotate(f6, Double.pi * 0.5, 1, 0, 0)
        let c6 = CALayer()
        c6.backgroundColor = UIColor.purple.cgColor
        c6.frame = layerFrame
        c6.transform = f6
        cube.addSublayer(c6)
        
        view.layer.addSublayer(cube)
    }
    
    @objc func touchBackBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        var transform = CATransform3DIdentity
        let translation = sender.translation(in: self.view)
        transform = CATransform3DRotate(transform, translation.x * Double.pi * 2 / view.width, 0, 1, 0)
        transform = CATransform3DRotate(transform, translation.y * -Double.pi * 2 / view.height, 1, 0, 0)
        cube.transform = transform
    }
}
