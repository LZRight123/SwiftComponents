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
import KakaJSON

import Kingfisher
extension String: Resource {
    public var cacheKey: String { return self }
    public var downloadURL: URL {
        guard let str = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return URL(string: "https://test.com")!
        }
        let component = URLComponents(string: str)
        return component?.url ?? URL(string: "https://test.com")!
    }
}

enum Apis: DSXTargetType {
    case test
    var path: String { "" }
    var parameters: [String : Any]? { nil }
}

enum AAAA: DSXTargetType {
    case aaaa
    var path: String { "" }
    var parameters: [String : Any]? { nil }
}

struct TestModel: Convertible {
    
}

class TVC: UIViewController {
    func tttt() {
        CGI.request(Apis.test) {  _ in }
        CGI.request(AAAA.aaaa) {  _ in }
        
        CGI.rx.request(Apis.test, modelType: TestModel.self)
        CGI.rx.request(AAAA.aaaa, modelType: TestModel.self)

    }
}


struct FromLink {
    var froms = [String]()
    
    func from<T: UIViewController>(_ type: T.Type) -> Self {
        var froms = self.froms
        froms.append(type.identifier)
        return .init(froms: froms)
    }
}

private let margin: CGFloat = 19
private let verticalPadding: CGFloat = 12
class ViewController: UIViewController {
    lazy var collectionView = UICollectionView(scrollDirection: .vertical, layout: LeftAlignedCollectionViewLayout(), interitemSpacing: 10, lineSpacing: 10, sectionInset: UIEdgeInsets.init(horizontal: 20, vertical: 20)).then {
        $0.backgroundView = UIView()
        let imgView = UIImageView(image: UIImage(named: "bg-ywq"))
        $0.backgroundView?.add(imgView).snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        $0.backgroundColor = .hexF6F6F6
        $0.dataSource = self
        $0.delegate = self
        $0.register(ItemsCCell.self)
        $0.register(TagCCell.self)
    }
    
    
    let imageView = UIImageView(color: .random)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        CGI.requestObject(Apis.test, modeType: TestModel.self) { (_, r) in
            let x = r
        }
        
//        CGI.rx.request(<#T##targetType: TargetType##TargetType#>, modelType: <#T##Convertible.Protocol#>)
        
        view.add(collectionView).snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalToSuperview().offset(StatusBarH + NavBarH)
        }
        
        
//        view.add(imageView).snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.height.equalTo(ScreenWidth)
//        }
        
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    class TagCCell: LZCollectionViewCell {
        let titleLabel = UILabel(font: .font15, textColor: .white, text: .init(randomOfLength: .random(in: 3...15)))
        override func setupUI() {
            contentView.backgroundColor = .random
            contentView.cornerRadius = 15
            
            contentView.add(titleLabel).snp.makeConstraints {
                $0.center.top.equalToSuperview()
                $0.left.equalToSuperview().offset(15)
                $0.height.equalTo(30)
            }
        }
    }
    
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
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: TagCCell.self, for: indexPath)
//        cell.bind()
//        cell.btn.rx.tap.subscribe { _ in
//            let nextVC = RightLeftVC()
//            nextVC.setupTransitioningAnimate(.rightToLeft)
//            self.presentVC(nextVC)
//        }.disposed(by: self.disposeBag)
        return cell
    }
    

}



class RightLeftVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        let mask = UIView(color: .random)
        view.add(mask).snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissVC()
    }
}
