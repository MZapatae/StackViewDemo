//
//  BannerSectionBuilder.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

struct BannerSection: ConfiguratedSection {
    var view: UIView
    var type: DemoSections
    let position: Int = 3
    
    init(view: UIView, type: DemoSections) {
        self.view = view
        self.type = type
    }
}

class BannerSectionBuilder: SectionBuilder {
    private(set) var color: UIColor?
    
    init() { }
    
    @discardableResult
    func setBackgroundColor(_ color: UIColor) -> BannerSectionBuilder {
        self.color = color
        return self
    }
    
    func build() -> ConfiguratedSection {
        let bannerView = BannerView()
        
        if let color = color {
            bannerView.contentView.backgroundColor = color
        }
        
        return BannerSection(view: bannerView, type: .banner)
    }
    
}
