//
//  ImageSectionBuilder.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

struct ImageSection: ConfiguratedSection {
    var view: UIView
    var type: DemoSections
    let position: Int = 2
    
    init(view: UIView, type: DemoSections) {
        self.view = view
        self.type = type
    }
}

class ImageSectionBuilder: SectionBuilder {
    
    init() { }
    
    func build() -> ConfiguratedSection {
        let imageView = ImageView()
        return ImageSection(view: imageView, type: .image)
    }
    
}
