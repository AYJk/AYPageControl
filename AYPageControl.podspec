Pod::Spec.new do |s|

  s.name         = "AYPageControl"
  s.version      = "0.0.2"
  s.summary      = "A PageControl With Drop Animation"
  s.homepage     = "https://github.com/AYJk/AYPageControl.git"
  s.license             = { :type => "MIT", :file => "LICENSE" } 
  s.author       = { "Andy" => "andy5759520@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/AYJk/AYPageControl.git", :tag => s.version }
  s.source_files = "AYPageControl/AYPageControl/*.{h,m}"
  s.requires_arc = true

end