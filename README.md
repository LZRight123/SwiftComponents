
# SwiftComponents组件

1. router 依赖 [URLNavigator](https://github.com/devxoul/URLNavigator) 
2. Extensions依赖[SwifterSwift](https://github.com/SwifterSwift/SwifterSwift)
3. Rx部分依赖  
- RxSwift 
- RxViewController   
- RxOptional
- RxDataSources
- MJRefresh
- MBProgressHUD
- 后期考虑引入 RxKeyboard  'Moya/RxSwift'  [Moya-KakaJson]( https://github.com/Guoxiafei/Moya-KakaJson)  
- hook方法见[航哥](https://www.hangge.com/blog/cache/detail_2049.html)
4. tools依赖 
- SnapKit
- Kingfisher
- MBProgressHUD
5. service依赖
- Moya
- KakaJSON
- SwiftyJSON

## [组件化实践](https://liangmc.com/archives/ios%E7%BB%84%E4%BB%B6%E5%8C%96)


## 考虑集成中...
1. [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess)
2. [BEMCheckBox](https://github.com/Boris-Em/BEMCheckBox)
3. [IHKeyboardAvoiding](https://github.com/IdleHandsApps/IHKeyboardAvoiding)


### Use
1. pod update SwiftComponents --no-repo-update
2. pod 'SwiftComponents', :path => '../SwiftComponents'
3. pod 'SwiftComponents/router', :git => 'https://github.com/LZRight123/SwiftComponents.git'
4. pod 'SwiftComponents', :podspec => 'https://github.com/LZRight123/SwiftComponents/blob/master/SwiftComponents.podspec'

## 示例