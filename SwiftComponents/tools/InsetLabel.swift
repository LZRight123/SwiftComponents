//
//  InsetLabel.swift
//  Deer
//
//  Created by liangze on 2020/7/22.
//  Copyright © 2020 zhuxiaoliang. All rights reserved.
//

import UIKit

open class InsetLabel: LZView {
    public let label = UILabel(font: .font11, textColor: .init(hex: "8e44ad"), text: "健康达人").then {
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    open var edgeInsets = UIEdgeInsets.zero {
        didSet {
            label.snp.remakeConstraints {
                $0.edges.equalToSuperview().inset(edgeInsets)
            }
        }
    }
    
    open override func setupUI() {
        add(label).snp.makeConstraints {
            $0.edges.equalToSuperview().inset(edgeInsets)
        }
    }

    open func setup(font: UIFont = .font14, textColor: UIColor = .hex222222, text: String? = "", numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        label.font = font
        label.textColor = textColor
        label.text = text
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
    }
}
