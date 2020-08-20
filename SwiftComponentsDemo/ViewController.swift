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

private let margin: CGFloat = 16
class ViewController: UIViewController {
    var sections = 3
    let disposeBag = DisposeBag()
    let topView = TopView()
    private lazy var collectionView = UICollectionView(scrollDirection: .vertical).then {
//        if let layout = $0.collectionViewLayout as? UICollectionViewFlowLayout {
////            layout.itemSize = UICollectionViewFlowLayout.automaticSize
//            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
////            layout.estimatedItemSize = CGSize(width: ScreenWidth - 2 * margin, height: 44)
//        }
//        ($0.collectionViewLayout as? UICollectionViewFlowLayout)?.estimatedItemSize = .init(width: ScreenWidth - 2 * margin, height: 44)
        $0.register(UICollectionViewCell.self)
        $0.register(nib: ScoreActivitiyItemCCell.self)
        $0.register(ProductDetailScoreCell.self)
        
        $0.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withClass: TitleHeaderView.self)
        $0.register(supplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withClass: FooterView.self)
        $0.dataSource = self
        $0.delegate = self
    }

    let pageRequest = PageRequest()
    
    let showLoadingRelay = PublishRelay<Bool>()
    
    private lazy var tableView = UITableView(style: .plain).then {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add(tableView).snp.makeConstraints { $0.edges.equalToSuperview() }
        
        tableView.mj_header = MJRefreshNormalHeader()
        tableView.mj_footer = MJRefreshBackNormalFooter()
        
//
//        tableView.mj_header?.rx.refreshing
//            .map{ _ in 1 }
//            .bind(to: pageRequest.rx.reset).disposed(by: disposeBag)
//
//        tableView.mj_footer?.rx.refreshing.map { _ in 1 }.bind(to: pageRequest.rx.increase).disposed(by: disposeBag)
        

        let btn1 = UIButton(color: .random)
        
        let btn2 = UIButton(color: .random)
        
        let btn3 = UIButton(color: .random)

        
        [btn1, btn2, btn3].forEach { $0.snp.makeConstraints { $0.height.equalTo(50) } }
        
        let stack = UIStackView(arrangedSubviews: [btn1, btn2, btn3], spacing: 10, alignment: .fill, distribution: .fill)
        
        view.add(stack).snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(74)
            $0.leading.equalToSuperview().offset(50)
        }
        
        let s = "https://dev.oms.luguanjia.com/mini?id=251&amp;officeName=第一社区卫生室&amp;name=陈瑾立&amp;userRoyaltyCode=offline&amp;defaultDelivery=null".replacingOccurrences(of: "&amp;", with: "&")
        let com = URLComponents(string: s)
        
        
        btn1.rx.tap.subscribe { _ in
            navigator.push("https://dev.oms.luguanjia.com/mini?id=201|officeName=金银湖街卫生院|name=陈也|userRoyaltyCode=doctor|defaultDelivery=1 家医码", context: ["1": "2"])
        }.disposed(by: disposeBag)
        
        btn2.rx.tap.subscribe { _ in
            navigator.present("https://dev.oms.luguanjia.com/mini?id=201&officeName=金银湖街卫生院&name=陈也&userRoyaltyCode=doctor&defaultDelivery=1 家医码", context: "字符串？？？？")
        }.disposed(by: disposeBag)
        
        btn3.rx.tap.subscribe { _ in
            
        }.disposed(by: disposeBag)
     
//        btn1.rx.tap.map{ _ in "click rx btn1" }.bind(to: UIViewController.topViewController()!.rx.toast).disposed(by: disposeBag)
        
        btn1.rx.tap.map{ _ in true }.bind(to: tableView.mj_header!.rx.endRefreshing).disposed(by: disposeBag)
        btn1.rx.tap.map{ _ in true }.bind(to: tableView.mj_footer!.rx.endRefreshing).disposed(by: disposeBag)

        btn1.rx.tap.subscribe { _ in
            print(self.pageRequest.pageNumber)
        }.disposed(by: disposeBag)
//        btn2.rx.tap.subscribe { [unowned self] _ in
//            self.view.showLoading()
//        }.disposed(by: disposeBag)
        
        btn2.rx.tap.map { _ in true }.bind(to: showLoadingRelay).disposed(by: disposeBag)
        
        btn2.rx.tap.delay(.seconds(2), scheduler: MainScheduler.instance).map { _ in false }.bind(to: showLoadingRelay).disposed(by: disposeBag)
        
//        showLoadingRelay.bind(to: rx.isShowLoading).disposed(by: disposeBag)
        
        btn3.rx.tap.map  { _ in "click rx btn at bottom \n bottom" }.bind(to: rx.toastAtBottom).disposed(by: disposeBag)
        
//        title = "积分活动"
//        navigationController?.navigationBar.setBackgroundImage(UIImage.init(color:  .random, size: CGSize.init(width: 10, height: 10)), for: .default)
//
        initiaUI()
        self.collectionView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ui
    func initiaUI() {
        view.add(collectionView).snp.makeConstraints { $0.edges.equalToSuperview() }
        
        collectionView.contentInset = .init(top: TopView.emHeight, left: 0, bottom: 0, right: 0)
        collectionView.add(topView).snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(TopView.emHeight)
            $0.bottom.equalTo(collectionView.snp.top)
        }
    
        
    }
  

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    //MARK: - size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: ScreenWidth, height: 45)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: ScreenWidth - 2 * margin, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: ScreenWidth, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         .init(top: 0, left: margin, bottom: 0, right: margin)
    }
    

}





extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { sections }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withClass: UICollectionViewCell.self, for: indexPath)
//        cell.backgroundColor = .random
//        return cell
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withClass: ScoreActivitiyItemCCell.self, for: indexPath)
            return cell
        case 2: break
        default : break
        }
        let cell = collectionView.dequeueReusableCell(withClass: ProductDetailScoreCell.self, for: indexPath)
        cell.backgroundColor = .random
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader  {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: TitleHeaderView.self, for: indexPath)
            header.contentView.frame = .init(x: margin, y: 0, width: ScreenWidth - 2 * margin, height: 45)
            header.contentView.backgroundColor = .white
            switch indexPath.section {
            case 0:
                header.style = .one
                header.titleLabel.text = "积分攻略"
                header.subtitleLabel.text = "赚积分必备小攻略~"
                header.contentView.mask(corners: [.topLeft, .topRight], radius: 8)
            case 1:
                header.style = .two
                header.titleLabel.text = nil
                header.subtitleLabel.text = "还有更多赚积分的途径哦~"
                header.contentView.mask(corners: [.topLeft, .topRight], radius: 0)
            case 2:
                header.titleLabel.text = nil
                header.subtitleLabel.text = nil
                header.contentView.backgroundColor = .clear
                return header
            default: break
            }
            return header
        }
        // footer
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: FooterView.self, for: indexPath)
        footer.contentView.backgroundColor = .white
        footer.bottomRadius = 0
        switch indexPath.section {
        case 0: break
        case 1: footer.bottomRadius = 10
        case 2:
            footer.contentView.backgroundColor = .clear
        default: break
        }
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.sections = Int.random(in: 10...20)
        
        collectionView.reloadData()
    }
    

}

 


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UITableViewCell.self)
        cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections = Int.random(in: 5...10)
        
        tableView.reloadData()
    }
}






//MARK: - 子视图
extension ViewController {
    class TopView: LZView {
        static let emHeight: CGFloat = 115
        private let helperView = UIView(color: .random)
        private let bgImgView = UIImageView(image: nil)
        override func setupUI() {
            layer.zPosition = -1
            add(helperView).snp.makeConstraints {
                $0.bottom.equalTo(self.snp.top)
                $0.left.right.equalToSuperview()
                $0.height.equalTo(ScreenHeight)
            }
            
            add(bgImgView).snp.makeConstraints {
                $0.left.top.right.equalToSuperview()
            }
        }
    }
    
    class TitleHeaderView: LZCollectionReusableView {
        enum Style {
            case one
            case two
        }
        let titleLabel = UILabel(font: .font15, textColor: .random, text: "")
        let subtitleLabel = UILabel(font: .font12, textColor: .init(hex: "FC0000"), text: "")
        override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
            layoutAttributes.frame = .init(origin: layoutAttributes.frame.origin, size: .init(width: ScreenWidth - 100, height: bounds.height))
            super.apply(layoutAttributes)
            
            print("")
            
        }
        var style: Style = .one {
            didSet {
                switch style {
                case .one:
                    titleLabel.snp.remakeConstraints {
                        $0.centerY.equalToSuperview()
                        $0.left.equalToSuperview().offset(15)
                    }
                    subtitleLabel.snp.remakeConstraints {
                        $0.centerY.equalToSuperview()
                        $0.right.equalToSuperview().offset(-12)
                    }
                case .two:
                    subtitleLabel.snp.remakeConstraints {
                        $0.centerY.equalToSuperview()
                        $0.left.equalToSuperview().offset(15)
                    }
                }
            }
        }
        
        override func setupUI() {
            contentView.backgroundColor = .white
            edgeInsets = .init(top: 0, left: margin, bottom: 0, right: margin)

            contentView.addSubviews(titleLabel, subtitleLabel)
        }
    }
    
    class FooterView: LZCollectionReusableView {
        var bottomRadius: CGFloat = 0
        override func setupUI() {
            contentView.backgroundColor = .red
            edgeInsets = .init(top: 0, left: margin, bottom: 0, right: margin)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            
            let path = UIBezierPath()
            let height = contentView.bounds.height
            let width = contentView.bounds.width
            let radius: CGFloat = min(bottomRadius, height)

            path.move(to: .init(x: width, y: 0))
            path.addLine(to: .init(x: width, y: height - radius))
            path.addArc(withCenter: .init(x: width - radius, y: height - radius), radius: radius, startAngle: 0 , endAngle: .pi / 2, clockwise: true)

            
            path.addLine(to: .init(x: radius, y: height))
            path.addArc(withCenter: .init(x: radius, y: height - radius), radius: radius, startAngle: .pi / 2, endAngle: .pi, clockwise: true)
            path.addLine(to: .zero)
            path.close()
            
            let maskLayer = CAShapeLayer()
            maskLayer.frame = contentView.bounds
            maskLayer.path = path.cgPath
            contentView.layer.mask = maskLayer

        }
    }
}



