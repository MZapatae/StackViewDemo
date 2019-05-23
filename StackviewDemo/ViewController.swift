//
//  ViewController.swift
//  StackviewDemo
//
//  Created by Miguel Angel Zapata Elizalde on 5/22/19.
//  Copyright © 2019 Miguel A. Zapata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    
    let availableSections: DemoSections = [.title, .image, .banner]

    var loadedSections: [ConfiguratedSection] = [] {
        willSet {
            self.loadedSections.removeAll()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        edgesForExtendedLayout = []
        setStackView()
        //loadDelayBanner()
    }
    
    private func setStackView() {
        let stackViewFactory = StackViewFactory(title: "Miguel A. Zapata")
        
        loadedSections = stackViewFactory.getSections(availableSections)
        loadedSections.forEach { stackView.addArrangedSubview($0.view) }
    }
    
    private func loadDelayBanner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let bannerView = self.loadedSections.first { $0.type == .banner }?.view as! BannerView
            bannerView.bannerInfoHasReceived = true
        }
    }


}

