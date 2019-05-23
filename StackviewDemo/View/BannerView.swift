//
//  BannerView.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

class BannerView: UIView {
    private let xibName = "BannerView"
    
    @IBOutlet var contentView: UIView!
    
    var bannerInfoHasReceived: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.4, animations: {
                self.invalidateIntrinsicContentSize()
                self.setNeedsLayout()
                self.layoutIfNeeded()
            })
        }
    }
    
    private static var bannerWithoutInfoViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 0.0)
    }
    
    private static var bannerWithInfoViewSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 350.0)
    }
    
    override var intrinsicContentSize: CGSize {
        if bannerInfoHasReceived {
            contentView.isHidden = false
            return BannerView.bannerWithInfoViewSize
        } else {
            contentView.isHidden = true
            return BannerView.bannerWithoutInfoViewSize
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public convenience init(rootViewController: UIViewController?) {
        self.init(frame: .init(origin: CGPoint(x: 0, y: 0), size: BannerView.bannerWithoutInfoViewSize))
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
