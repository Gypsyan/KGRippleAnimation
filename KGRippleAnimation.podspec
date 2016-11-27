Pod::Spec.new do |s|
  s.name         = "KGRippleAnimation"
  s.version      = "1.0.2"
  s.summary      = "Add Ripple action around a button"
  s.homepage     = "https://github.com/Gypsyan/KGRippleAnimation"
  s.license      = 'Apache License, Version 2.0'
  s.author             = { "Ananth" => "ananthanmymail@gmail.com" }
  s.ios.deployment_target = "10.0"
  s.source       = { :git => "https://github.com/Gypsyan/KGRippleAnimation.git", :tag => s.version }
  s.source_files  = "KGRippleAnimation/*.swift"
end
