//
//  ViewControllerViewController.swift
//  Deer
//
//  Created by liangze on 2020/7/23.
//  Copyright © 2020 zhuxiaoliang. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import MJRefresh
import URLNavigator
import SwifterSwift

private let margin: CGFloat = 19
private let verticalPadding: CGFloat = 12
class ViewController: UIViewController {
    lazy var collectionView = UICollectionView(scrollDirection: .vertical, lineSpacing: 12, sectionInset: .init(horizontal: 13, vertical: 10)).then {
        $0.backgroundView = UIView()
        let imgView = UIImageView(image: UIImage(named: "bg-ywq"))
        $0.backgroundView?.add(imgView).snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        $0.backgroundColor = .hexF6F6F6
        $0.dataSource = self
        $0.delegate = self
        $0.register(ItemsCCell.self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add(collectionView).snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(StatusBarH + NavBarH)
        }
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    class ItemView: LZControl {
        let titleLabel = UILabel(font: .font15, textColor: .hex222222, text: "拜访动态")
        let arrowImage = UIImageView(image: UIImage(color: .random, size: .init(width: 7, height: 12)))
        
        override func setupUI() {
            add(titleLabel).snp.makeConstraints {
                $0.left.equalToSuperview().offset(margin)
                $0.centerY.equalToSuperview()
                $0.top.equalToSuperview().offset(verticalPadding)
            }
            
            add(arrowImage).snp.makeConstraints {
                $0.right.equalToSuperview().offset(-margin)
                $0.centerY.equalToSuperview()
            }
        }
    }
    
    class ItemsCCell: LZCollectionViewCell {
        let btn = UIButton(font: .font14, title: "  拜访看板", titleColor: .hex666666, image: UIImage(color: .random, size: .init(width: 14, height: 14)))
        let stack = UIStackView(arrangedSubviews: [], spacing: 0, alignment: .fill)
        
        override func setupUI() {
            backgroundColor = .white
            contentView.snp.remakeConstraints {
                $0.edges.equalToSuperview()
                $0.width.equalTo(ScreenWidth - 13 * 2)
            }
            
            add(btn).snp.makeConstraints {
                $0.left.equalToSuperview().offset(margin)
                $0.top.equalToSuperview().offset(verticalPadding)
            }
            
            add(stack).snp.makeConstraints {
                $0.left.right.equalToSuperview()
                $0.top.equalTo(btn.snp.bottom).offset(verticalPadding)
                $0.bottom.equalToSuperview().offset(-verticalPadding)
            }
            
            cornerRadius = 12
        }
        
        func bind(_ model: Int = 0)  {
            stack.removeArrangedSubviews()
            stack.removeSubviews()
            
            for _ in 0..<5 {
                let itemView = ItemView()
                stack.addArrangedSubview(itemView)
            }
        }
        
    }
    
    
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: ItemsCCell.self, for: indexPath)
        cell.bind()
        return cell
    }
    

}
