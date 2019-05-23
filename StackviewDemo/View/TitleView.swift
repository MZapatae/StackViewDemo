//
//  TitleView.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/22/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

class TitleView: UIView {
    private let xibName = "TitleView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    private static var defaultViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 100)
    }
    
    override var intrinsicContentSize: CGSize {
        return contentView.frame.size
    }
    
    private var titleText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public convenience init(title: String) {
        self.init(frame: .init(origin: CGPoint(x: 0, y: 0), size: TitleView.defaultViewSize))
        self.titleText = title
        updateLabels()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        updateLabels()
    }
    
    private func updateLabels() {
        titleLabel.text = titleText
    }
}
