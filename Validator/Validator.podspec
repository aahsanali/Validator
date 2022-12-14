
Pod::Spec.new do |spec|

  spec.name         = "Validator"
  spec.version      = "0.0.6"
  spec.summary      = "A short description of Validator."
  
  spec.homepage     = "www.google.com"
  spec.license      = "MIT"
  
  spec.author             = { "Naveed A." => "naveed.ahsan@coeus-solutions.de" }
  spec.platform     = :ios, "13.1"
  

#  spec.source       = { :git => "https://github.com/aahsanali/Validator.git", :tag => spec.version.to_s } # github path
  spec.source       = { :git => "../../Validator", :tag => "0.0.4" } # Local git path
  spec.source_files  = "Validator/**/*.{swift}"
#  spec.dependency 'Alamofire'
  
#  spec.frameworks = 'XCTest'
  
  spec.weak_framework = "XCTest"
    spec.pod_target_xcconfig = {
      'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"',
    }
  
end
