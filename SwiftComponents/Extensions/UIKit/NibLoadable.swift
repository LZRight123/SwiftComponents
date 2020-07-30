//
//  NibLoadable.swift
//  Sundell
//
//  Created by 梁泽 on 2019/4/6.
//  Copyright © 2019 梁泽. All rights reserved.
//

import UIKit
//MARK:- 协议
public protocol NibLoadable: class { }

public protocol DequeueReusableCell: class { }

//MARK:- UI 扩展
extension UITableViewCell: DequeueReusableCell {}
extension UICollectionViewCell: DequeueReusableCell {}

//MARK:- 协议扩展


public extension DequeueReusableCell where Self: UITableViewCell {
    @available(*, deprecated, message: "请用 TableView dequeue方法")
    static func dequeueReusable(for talbeView: UITableView) -> Self {
        guard let cell = talbeView.dequeueReusableCell(withIdentifier: identifier) as? Self else {
            fatalError("view of type '\(self).' inside '\(nibName).xib is nil?.'")
        }
        return cell
    }
    
    @available(*, deprecated, message: "请用 TableView dequeue方法")
    static func dequeueReusable(for talbeView: UITableView, indexPath: IndexPath) -> Self {
        guard let cell = talbeView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("view of type '\(self).' inside '\(nibName).xib is nil?.'")
        }
        return cell
    }
}

public extension DequeueReusableCell where Self: UICollectionViewCell {
    @available(*, deprecated, message: "请用 collectionView dequeue方法")
    static func dequeueReusable(for collectionView: UICollectionView, for indexPath: IndexPath) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("view of type '\(self).' inside '\(nibName).xib is nil?.'")
        }
        return cell
    }
    
    @available(*, deprecated, message: "请用 collectionView dequeue方法")
    static func queryCell(for collectionView: UICollectionView, indexPath: IndexPath) -> Self? {
        guard let cell = collectionView.cellForItem(at: indexPath) as? Self else {
            return nil
        }
        return cell
    }
}
