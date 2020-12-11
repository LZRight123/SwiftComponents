
//  UICollectionViewExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 11/12/2016.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
import SwifterSwift

// MARK: - Initializers
public extension UICollectionView {
    /// let collectionView = UICollectionView(scrollDirection: <#T##ScrollDirection#>, userInteractionEnabled: <#T##Bool#>, backgroundColor: <#T##UIColor?#>, layout: <#T##UICollectionViewFlowLayout#>, interitemSpacing: <#T##CGFloat#>, lineSpacing: <#T##CGFloat#>, sectionInset: <#T##UIEdgeInsets#>)
    convenience init(scrollDirection: UICollectionView.ScrollDirection, userInteractionEnabled: Bool = true, backgroundColor: UIColor? = UICollectionView.appearance().backgroundColor, layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout() ,interitemSpacing: CGFloat = 0.0, lineSpacing: CGFloat = 0.0, sectionInset: UIEdgeInsets = .zero, needEstimatedItemSize: Bool = true) {
        layout.minimumInteritemSpacing = interitemSpacing
        layout.minimumLineSpacing = lineSpacing
        layout.scrollDirection = scrollDirection
        if needEstimatedItemSize {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        layout.sectionInset = sectionInset
        self.init(frame: .zero, collectionViewLayout: layout)
        scrollsToTop = false
        isUserInteractionEnabled = userInteractionEnabled
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        alwaysBounceVertical = true

        self.backgroundColor = backgroundColor
    }
    
}

// MARK: - Methods
public extension UICollectionView {
    func cellForItem<T: UICollectionViewCell>(at indexPath: IndexPath, cellClass: T.Type) -> T? {
        guard let cell = cellForItem(at: indexPath) as? T else {
            return nil
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(cellWithClass: type)
    }
    
    func register<T: UICollectionViewCell>(nib type: T.Type)  {
        register(nibWithCellClass: type)
    }

  
}

#endif
