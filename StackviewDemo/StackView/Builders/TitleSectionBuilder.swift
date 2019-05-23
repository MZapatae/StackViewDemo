//
//  TitleSectionBuilder.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

struct TitleSection: ConfiguratedSection {
    var view: UIView
    var type: DemoSections
    let position: Int = 1
    
    init(view: UIView, type: DemoSections) {
        self.view = view
        self.type = type
    }
}

class TitleSectionBuilder: SectionBuilder {
    private(set) var title: String
    
    init(title: String) {
        self.title = title
    }
    
    @discardableResult
    func setLoremIpsumText() -> TitleSectionBuilder {
        title = title + " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum ligula id lacus dignissim accumsan. Cras placerat lectus justo, viverra volutpat arcu rhoncus vitae. Cras ex erat, egestas sed turpis eget, ullamcorper lacinia diam. Morbi sit amet erat vehicula, porta ex venenatis, mollis libero. Nunc varius lorem vitae mi pulvinar pellentesque. Nunc in est laoreet, condimentum sapien ut, eleifend turpis. Nam nunc sapien, sodales ut semper vitae, maximus sed velit. In efficitur porttitor elit vel faucibus. Ut interdum ullamcorper tortor, id tempor sem ultricies eget. Proin dui ante, dictum a risus ut, accumsan aliquam turpis. Nullam vitae pretium ligula"
        return self
    }
    
    func build() -> ConfiguratedSection {
        let titleView = TitleView(title: title)
        return TitleSection(view: titleView, type: .title)
    }
    
}
