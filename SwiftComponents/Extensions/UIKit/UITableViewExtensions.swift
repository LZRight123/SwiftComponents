//
//  UITableViewExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/22/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Initializers
public extension UITableView {
    convenience init(style: UITableView.Style = .plain, backgroundColor: UIColor = .backgorundColor, separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init(frame: .zero, style: style)
        self.backgroundColor = backgroundColor
        self.estimatedRowHeight = 99.9
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        showsVerticalScrollIndicator = false
        self.separatorStyle = separatorStyle
        separatorColor = .line1
        keyboardDismissMode = .onDrag
    }
}

// MARK: - Properties
public extension UITableView {



}

// MARK: - Methods
public extension UITableView {

   
    func update(block: (() -> Void)) {
        beginUpdates()
        block()
        endUpdates()
    }
    
    func cellForRow<T: UITableViewCell>(_ indexPath: IndexPath, class: T.Type) -> T? {
        guard let cell = cellForRow(at: indexPath) as? T else {
            return nil
        }
        return cell
    }
    
    
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(cellWithClass: type)
    }
    
    func register<T: UITableViewCell>(nib type: T.Type)  {
        register(nibWithCellClass: type)
    }

}

#endif
