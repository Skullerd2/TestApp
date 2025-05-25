//
//  CustomTabBar.swift
//  TestApp
//
//  Created by Vadim on 24.05.2025.
//

import UIKit

class CustomTabBar: UITabBar {

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 82
        return size
    }

}
