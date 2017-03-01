use_frameworks!

target 'VIPER-Douban' do
  pod 'Alamofire', '~> 4.3.0'
  pod 'ObjectMapper', '~> 2.2.2'
  pod 'RxSwift', '~> 3.1.0'
  pod 'Swinject', '~> 2.0.0'
  pod 'RxAlamofire'
  pod 'IGListKit', '~> 2.0.0'
  pod 'Kingfisher', '~> 3.3.1'
  pod 'Cosmos', '~> 8.0'
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end
end

target 'VIPER-DoubanTests' do
  pod 'Quick', '~> 1.0.0'
  pod 'Nimble', '~> 5.1.1'

  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
          end
      end
  end
end
