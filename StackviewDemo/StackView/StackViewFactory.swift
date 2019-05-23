//
//  StackViewFactory.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/23/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

class StackViewFactory: StackViewFactoryProtocol {
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    // MARK: Builders
    
    private lazy var titleSection: ConfiguratedSection = {
        let titleSection = TitleSectionBuilder(title: title)
        //titleSection.setLoremIpsumText()
        return titleSection.build()
    }()
    
    private lazy var imageSection: ConfiguratedSection = {
        return ImageSectionBuilder().build()
    }()
    
    private lazy var bannerSection: ConfiguratedSection = {
        let bannerSection = BannerSectionBuilder()
        //bannerSection.setBackgroundColor(.red)
        return bannerSection.build()
    }()
    
    // MARK: Factory getter
    
    func getConfiguratedSections(_ sections: DemoSections) -> [ConfiguratedSection] {
        let sectionsConfigurated: [ConfiguratedSection] = getSections(sections)
        
        guard !hasDuplicatedPositions(into: sectionsConfigurated) else {
            fatalError("Check the position property in every Section, you probably use the same position in two or more sections")
        }
        
        return sectionsConfigurated.sorted(by: { $0.position < $1.position })
    }
    
}

extension StackViewFactory {
        
    func getSections(_ sections: DemoSections) -> [ConfiguratedSection] {
        var sectionsConfigurated: [ConfiguratedSection] = []
        
        if sections.contains(.title) {
            sectionsConfigurated.append(titleSection)
        }
        
        if sections.contains(.image) {
            sectionsConfigurated.append(imageSection)
        }
        
        if sections.contains(.banner) {
            sectionsConfigurated.append(bannerSection)
        }

        return sectionsConfigurated
    }

}

extension StackViewFactory {
    
    private func hasDuplicatedPositions(into sections: [ConfiguratedSection]) -> Bool {
        let totalPositions = sections.map { $0.position }.count
        let distinctsPositions = Array(Set(sections.map { $0.position })).count
        return totalPositions != distinctsPositions
    }
    
}
