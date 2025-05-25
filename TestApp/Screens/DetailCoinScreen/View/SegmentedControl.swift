//
//  SegmentedControl.swift
//  TestApp
//
//  Created by Vadim on 25.05.2025.
//

import UIKit

@IBDesignable class SegmentedControl: UIControl {
    
    private var labels = [UILabel]()
    var thumbView = UIView()
    var items: [String] = ["24H", "1W", "1Y", "ALL", "Point"] {
        didSet {
            setupLabels()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = 28
        backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9450980392, alpha: 1)
        setupLabels()
        insertSubview(thumbView, at: 0)
    }
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRectZero)
            label.attributedText = NSAttributedString(string: items[index - 1], attributes: [
                .font: UIFont(name: "Poppins Medium", size: 14)!,
                .foregroundColor: #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
            ])
            label.textAlignment = .center
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let totalWidth = self.bounds.width
        let totalHeight = self.bounds.height
        let segmentWidth = totalWidth / CGFloat(items.count)

        let thumbWidth = segmentWidth - 8
        let thumbHeight = totalHeight - 8
        let thumbX = CGFloat(selectedIndex) * segmentWidth + 4
        let thumbY = 4
        
        thumbView.frame = CGRect(x: thumbX, y: CGFloat(thumbY), width: thumbWidth, height: thumbHeight)
        thumbView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        thumbView.layer.cornerRadius = thumbView.frame.height / 2
        thumbView.layer.shadowColor = #colorLiteral(red: 0.2156862745, green: 0.2, blue: 0.4901960784, alpha: 1)
        thumbView.layer.shadowOpacity = 0.1
        thumbView.layer.shadowOffset = CGSize(width: 0, height: 20)
        thumbView.layer.shadowRadius = 40
        
        let labelHeight = totalHeight
        let labelWidth = segmentWidth
        
        for (index, label) in labels.enumerated() {
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
    }

    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex : Int?
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    func displayNewSelectedIndex() {
        let segmentWidth = self.bounds.width / CGFloat(items.count)
        let segmentHeight = self.bounds.height
        let thumbWidth = segmentWidth - 8
        let thumbHeight = segmentHeight - 8
        let thumbX = CGFloat(selectedIndex) * segmentWidth + 4
        let thumbY = 4
        UIView.animate(withDuration: 0.25) {
            self.thumbView.frame = CGRect(x: thumbX, y: CGFloat(thumbY), width: thumbWidth, height: thumbHeight)
        }
    }

    
}
