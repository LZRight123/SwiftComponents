Pod::Spec.new do |s|
  # 框架的名称
  s.name         = "SwiftComponents"
  # 框架的版本号
  s.version      = "1.0.0"
  # 框架的简单介绍
  s.summary      = "关于iOS的一些组件."
  # 框架的详细描述(详细介绍，要比简介长)
  s.description  = <<-DESC
                    Include "分类，网络请求，工具方法", Support the Objective - C language.
                DESC
  # 框架的主页
  s.homepage     = "https://github.com/LZRight123/SwiftComponents"
  # 证书类型
  s.license      = { :type => "MIT", :file => "LICENSE" }

  # 作者
  s.author             = { "梁泽" => "350442340@qq.com" }
  # 社交网址
  s.social_media_url = 'https://github.com/LZRight123'
  
  # 框架支持的平台和版本
  s.platform     = :ios, "10.0"

  # GitHub下载地址和版本
  s.source       = {
     :git => "https://github.com/LZRight123/SwiftComponents.git", 
     :tag => s.version.to_s,
     :submodules => true
    }
  
  s.swift_version = '5.0'
  s.frameworks='Foundation','UIKit'
  
  # 设置 podspec 的默认 subspec
  s.default_subspecs = 'Extensions', 'service_rx', 'tools', 'router', 'rxcomponents'
  
  # 本地框架源文件的位置（包含所有文件）
  # s.source_files  = "SwiftComponents/**/*.swift"
  # 一级目录（pod库中根目录所含文件）
  
  # 每次都参与编译方便修改时 在子工程里写
#  s.static_framework = true
  # 二级目录（根目录是s，使用s.subspec设置子目录，这里设置子目录为ss）
  s.subspec 'Extensions' do |ss|
    ss.source_files = 'SwiftComponents/Extensions/**/*.swift'
    # 框架包含的资源包
    # ss.resources  = 'SwiftComponents/SwiftComponents/SwiftComponents.bundle'
    # ss.subspec 'CoreGraphics' do |sss|
    #   sss.source_files = 'SwiftComponents/Extensions/CoreGraphics/*.swift'
    ss.dependency "SwifterSwift"
  end

  # 网络请求 数据解析
  s.subspec 'service' do |ss|
#    ss.static_framework = true
    ss.source_files = 'SwiftComponents/service/**/*.swift'

    ss.dependency "Moya"#, "~> 13.0.0"
    ss.dependency "KakaJSON"
    ss.dependency "SwiftyJSON"
    ss.dependency 'YYCache'
  end

  s.subspec 'service_rx' do |ss|
    ss.source_files = 'SwiftComponents/service_rx/**/*.swift'
    ss.dependency 'SwiftComponents/service'
    ss.dependency "RxSwift", "~> 5.0"
  end

  # 工具类
  s.subspec 'tools' do |ss|
#    ss.static_framework = true
    ss.source_files = 'SwiftComponents/tools/**/*.swift'

    ss.dependency "SnapKit"
    ss.dependency "Kingfisher"
    ss.dependency "MBProgressHUD"
  end
  
  s.subspec 'router' do |ss|
    ss.platform     = :ios, "9.0"

#    ss.static_framework = true
    ss.source_files = 'SwiftComponents/router/*.swift'
    
    ss.dependency "URLNavigator"
  end
  
  # RX套件
  s.subspec 'rxcomponents' do |ss|
#    ss.static_framework = true
    ss.source_files = 'SwiftComponents/RxComponents/**/*.swift'
    
    ss.dependency "RxSwift"
    ss.dependency "RxCocoa"
    ss.dependency "RxWebKit"
    ss.dependency "RxDataSources"
    ss.dependency "RxOptional"
    ss.dependency "RxViewController"
    ss.dependency "Moya/RxSwift"
    ss.dependency "MJRefresh"
    ss.dependency "MBProgressHUD"
  end

  # 鹿管家公用组件
#  s.subspec 'LGJPublic' do |ss|
#    ss.static_framework = true
#    ss.source_files = 'SwiftComponents/LGJPublic/**/*.swift'
#
#  end


  # 框架要求ARC环境下使用
  s.requires_arc = true

 
end
