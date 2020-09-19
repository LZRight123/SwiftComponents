
// MIT License
//
// Copyright (c) 2018 Sudhanshu Singh
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


/// https://github.com/CheeseRoot/LeftAlignedCollectionViewLayout/blob/master/LeftAlignedCollectionViewLayout/LeftAlignedCollectionViewLayout.swift
import UIKit


public extension UICollectionViewLayoutAttributes {
    
    func setLeftAlignedFrame(withEdgeInsets edgeInsets: UIEdgeInsets) {
        var frame: CGRect = self.frame
        frame.origin.x = edgeInsets.left
        self.frame = frame
    }
}



open class LeftAlignedCollectionViewLayout: UICollectionViewFlowLayout {
    
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let defaultAttributes = super.layoutAttributesForElements(in: rect)
        var newAttributes: [UICollectionViewLayoutAttributes]? = defaultAttributes
        
        for index in 0..<defaultAttributes!.count {
            newAttributes?[index] = self.layoutAttributesForItem(at: defaultAttributes![index].indexPath)!
        }
        
        return newAttributes
    }
    
    
    open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let currentAttributes: UICollectionViewLayoutAttributes? = super.layoutAttributesForItem(at: indexPath)
        let layoutWidth = collectionView!.frame.width - sectionInset.left - sectionInset.right
        
        if indexPath.item == 0 {
            currentAttributes?.setLeftAlignedFrame(withEdgeInsets: sectionInset)
            return currentAttributes
        }
        
        let lastIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        var lastFrameMaxX: CGFloat = 0.0
        var lastFrame = CGRect.zero
        if let previousFrame = layoutAttributesForItem(at: lastIndexPath)?.frame {
            lastFrame = previousFrame
            lastFrameMaxX = previousFrame.origin.x + previousFrame.size.width
        }
        
        var currentFrameMax = CGRect.zero
        if let currentFrame = currentAttributes?.frame {
            currentFrameMax = CGRect(x: sectionInset.left, y: currentFrame.origin.y, width: layoutWidth, height: currentFrame.size.height)
        }
        
        if !lastFrame.intersects(currentFrameMax) {
            currentAttributes?.setLeftAlignedFrame(withEdgeInsets: sectionInset)
            return currentAttributes
        }
        
        if var frame = currentAttributes?.frame {
            frame.origin.x = lastFrameMaxX + minimumInteritemSpacing
            currentAttributes?.frame = frame
        }
        
        return currentAttributes
    }
}
