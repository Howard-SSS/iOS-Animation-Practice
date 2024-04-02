//
//  ReplicatorViewController.swift
//  iOS-Animation-Practice
//
//  Created by Howard-Zjun on 2024/04/02.
//

import UIKit

class ReplicatorViewController: BasicViewController {

    lazy var type1Btn: UIButton = {
        let type1Btn = UIButton(frame: .init(x: 0, y: naviView.maxY, width: 100, height: 50))
        type1Btn.setTitle("type1", for: .normal)
        type1Btn.setTitleColor(.black, for: .normal)
        type1Btn.addTarget(self, action: #selector(touchType1Btn), for: .touchUpInside)
        return type1Btn
    }()
    
    lazy var showView: UIView = {
        let showView = UIView(frame: .init(x: (view.width - 200) * 0.5, y: (view.height - 200) * 0.5, width: 200, height: 200))
        return showView
    }()
    
    weak var showLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(type1Btn)
        view.addSubview(showView)
    }
    
    @objc func touchType1Btn() {
        showLayer?.removeFromSuperlayer()
        showLayer = nil
        
        let circle = CALayer()
        circle.frame = .init(x: 0, y: 0, width: 10, height: 10)
        circle.backgroundColor = UIColor.black.cgColor
        circle.cornerRadius = 5
        circle.position = .init(x: showView.width * 0.5, y: 5)
        circle.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
        
        let toScale = CABasicAnimation(keyPath: "transform.scale")
        toScale.fromValue = 1
        toScale.toValue = 0
        toScale.duration = 1
        toScale.repeatCount = .greatestFiniteMagnitude
        circle.add(toScale, forKey: nil)
             
        let replicatorLayer = CAReplicatorLayer()
        let instanceCount = 30
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceDelay = toScale.duration / CFTimeInterval(instanceCount)
             
        let angle = Double.pi * 2 / CGFloat(instanceCount)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        replicatorLayer.frame = circle.frame
        replicatorLayer.addSublayer(circle)
        showView.layer.addSublayer(replicatorLayer)
        showLayer = replicatorLayer
    }
}
