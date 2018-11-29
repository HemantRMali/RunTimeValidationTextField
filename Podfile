# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RunTimeValidationTextField' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  
  use_frameworks!
  inhibit_all_warnings!
  # Pods for RunTimeValidationTextField
  pod 'IQKeyboardManagerSwift'
  pod 'JVFloatLabeledTextField'
  pod 'Cartography', '~> 3.1'

end
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings.delete('CODE_SIGNING_ALLOWED')
    config.build_settings.delete('CODE_SIGNING_REQUIRED')
  end
end


