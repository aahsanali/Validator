
Pod::Spec.new do |spec|

  spec.name         = "Validator"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of Validator."
  
  spec.homepage     = "www.google.com"
  spec.license      = "MIT"
  
  spec.author             = { "Naveed A." => "naveed.ahsan@coeus-solutions.de" }
  spec.platform     = :ios, "10.0"
  

  spec.source       = { :git => "https://github.com/aahsanali/Validator.git", :tag => spec.version.to_s }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  
end
