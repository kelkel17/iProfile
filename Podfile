# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'iProfile' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iProfile
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
  end
 end
end
