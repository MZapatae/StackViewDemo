//
//  ImageView.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/22/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ImageView: UIView {
    private let xibName = "ImageView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    private static var defaultViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80.0)
    }
    
    private static var padViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 350.0)
    }
    
    private static var phoneViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 80.0)
    }
    
    override var intrinsicContentSize: CGSize {
        return (UIDevice.current.userInterfaceIdiom == .pad) ? ImageView.padViewSize : ImageView.phoneViewSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public convenience init() {
        self.init(frame: .init(origin: CGPoint(x: 0, y: 0), size: ImageView.defaultViewSize))
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
