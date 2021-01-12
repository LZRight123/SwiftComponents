////
////  GTEmptyDataView.swift
////  JZT_SUPPLIER
////
////  Created by 梁泽 on 2020/12/8.
////  Copyright © 2020 com.FBBC.JoinTown. All rights reserved.
////
//
//import UIKit
//
///// 加类型 可以是中文
//@objc enum GTEmptyDataType: Int {
//    case normal
//    case noNetClickRefresh
//    case 暂未搜索到结果
//    case 没有可以供应给当前公司的药品
//}
//
//class GTEmptyDataView: LZControl {
//    @objc var emptyType: GTEmptyDataType = .normal {
//        didSet {
//            switch emptyType {
//            case .normal:
//                imageView.image = UIImage(named: "zwnr_p")
//                titleLabel.text = "暂无内容"
//            case .noNetClickRefresh:
//                imageView.image = UIImage(named: "wwl_p")
//                titleLabel.text = "网络不给力，点击刷新"
//            case .暂未搜索到结果:
//                imageView.image = UIImage(named: "zwnr_p")
//                titleLabel.text = "暂未搜索到结果"
//            case .没有可以供应给当前公司的药品:
//                imageView.image = UIImage(named: "zwnr_p")
//                titleLabel.text = "您没有可以供应给当前公司的药品"
//            }
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    private let disposeBag = DisposeBag()
//
//    @objc let imageView = UIImageView(image: UIImage(named: "zwnr_p"))
//    @objc let titleLabel = UILabel(font: .font16, textColor: .hex666666, text: "暂无内容", numberOfLines: 0, textAlignment: .center)
//    @objc let btn = UIButton(font: .font16, title: "无网络", titleColor: .hex666666)
//    lazy var stack = UIStackView(arrangedSubviews: [imageView, titleLabel, btn], spacing: 12, alignment: .center, distribution: .fill, axis: .vertical)
//    
//    @objc var didClickEmpty: HandlerBolck?
//    
//    override func setupUI() {
//        btn.isHidden = true
//        add(stack).snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.left.equalToSuperview().offset(13)
//        }
//        
//        rx.tapGesture().when(.recognized)
//            .subscribe(onNext: { [weak self] _ in
//                switch self?.emptyType {
//                case .noNetClickRefresh:
//                    self?.didClickEmpty?()
//                default: break
//                }
//            })
//            .disposed(by: disposeBag)
//    }
//    
//    @discardableResult
//    @objc func showIn(_ view: UIView?, type: GTEmptyDataType = .normal) -> GTEmptyDataView {
//        var spView = view
//        if view == nil {
//            spView = UIViewController.topViewController()?.view
//        }
//        guard let warpView = spView else {
//            return .init()
//        }
//        
//        warpView.add(self).snp.remakeConstraints {
//            $0.center.width.height.equalToSuperview()
//        }
//        isHidden = false
//        
//        emptyType = type
//        return self
//    }
//    
//    @discardableResult
//    @objc func showIn(_ view: UIView?, des: String? = "暂无内容", img: UIImage? = UIImage(named: "zwnr_p")) -> GTEmptyDataView {
//        var spView = view
//        if view == nil {
//            spView = UIViewController.topViewController()?.view
//        }
//        guard let warpView = spView else {
//            return .init()
//        }
//        
//        warpView.add(self).snp.remakeConstraints {
//            $0.center.width.height.equalToSuperview()
//        }
//        isHidden = false
//
//        titleLabel.text = des
//        imageView.image = img
//        return self
//    }
//    
//
//    @objc func dismiss() {
//        isHidden = true
//    }
//}
//
//private var GTEmptyViewKey: Void?
//extension UIViewController {
//    @objc var gtemptyView: GTEmptyDataView {
//        get {
//            let view: GTEmptyDataView
//            if let value = objc_getAssociatedObject(self, &GTEmptyViewKey) as? GTEmptyDataView {
//                view = value
//            } else {
//                view = GTEmptyDataView()
//                objc_setAssociatedObject(self, &GTEmptyViewKey, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//            return view
//        }
//        set {
//             objc_setAssociatedObject(self, &GTEmptyViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}
//
////extension UIView {
////    @objc var gtemptyView: GTEmptyDataView? {
////        set {
////            objc_setAssociatedObject(self, &GTEmptyViewKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
////        }
////        get {
////            return objc_getAssociatedObject(self, &GTEmptyViewKey) as? GTEmptyDataView
////        }
////    }
////
////    @discardableResult
////    @objc func showEmpty(_ type: GTEmptyDataType = .normal, action: (() -> ())? = nil) -> GTEmptyDataView? {
////        if gtemptyView == nil {
////            gtemptyView = GTEmptyDataView(color: .random)
////        }
////        if gtemptyView?.superview == nil {
////            add(gtemptyView!).snp.remakeConstraints {
////                $0.center.width.height.equalToSuperview()
////            }
////        }
////
////        gtemptyView?.emptyType = type
////        gtemptyView?.isHidden = false
////        gtemptyView?.didClickEmpty = action
////        return gtemptyView
////    }
////
////    @discardableResult
////    @objc func showEmpty(_ des: String? = "暂无内容", img: UIImage? = UIImage(named: "zwnr_p"), action: (() -> ())? = nil) -> GTEmptyDataView? {
////        if gtemptyView == nil {
////            gtemptyView = GTEmptyDataView()
////        }
////        if gtemptyView?.superview == nil {
////            add(gtemptyView!).snp.remakeConstraints {
////                $0.center.width.height.equalToSuperview()
////            }
////        }
////
////        gtemptyView?.imageView.image = UIImage(named: "wwl_p")
////        gtemptyView?.titleLabel.text = "网络不给力，点击刷新"
////
////        gtemptyView?.isHidden = false
////        gtemptyView?.didClickEmpty = action
////        return gtemptyView
////    }
////
////
////
////    @objc func hiddenEmpty() {
////        gtemptyView?.isHidden = true
////    }
////}
