//
//  StackViewFactoryContract.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

struct DemoSections: OptionSet {
    static let title = DemoSections(rawValue: 1 << 0)
    static let image = DemoSections(rawValue: 1 << 1)
    static let banner = DemoSections(rawValue: 1 << 2)
    
    let rawValue: Int
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

protocol SectionBuilder {
    func build() -> ConfiguratedSection
}

protocol ConfiguratedSection {
    var view: UIView { get }
    var type: DemoSections { get }
    var position: Int { get }
    
    init(view: UIView, type: DemoSections)
}

protocol StackViewFactoryProtocol: class {
    func getConfiguratedSections(_ sections: DemoSections) -> [ConfiguratedSection]
}
