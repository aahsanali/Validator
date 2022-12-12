
Pod::Spec.new do |spec|

  spec.name         = "Validator"
  spec.version      = "0.0.2"
  spec.summary      = "A short description of Validator."
  
  spec.homepage     = "www.google.com"
  spec.license      = "MIT"
  
  spec.author             = { "Naveed A." => "naveed.ahsan@coeus-solutions.de" }
  spec.platform     = :ios, "11.0"
  

  spec.source       = { :git => "https://github.com/aahsanali/Validator.git", :tag => spec.version.to_s }
  spec.source_files  = "Validator/**/*.{swift}"
  spec.dependency 'Alamofire'
  
end
