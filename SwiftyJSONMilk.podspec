Pod::Spec.new do |s|
  s.name         = "SwiftyJSONMilk"
  s.version      = "0.0.1"
  s.summary      = "A SwiftyJSON wrapper that implements Milk Serializer."
  s.homepage     = "https://github.com/jordanhamill/SwiftyJSONMilk"
  s.license      = 'MIT'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.author       = { "Jordan Hamill" => "jordan.hamill22@gmail.com" }
  s.source       = { :git => "https://github.com/jordanhamill/SwiftyJSONMilk.git", :tag => s.version.to_s }

  s.source_files = 'SwiftyJSONMilk/**/*.{h,m,swift}'
  s.requires_arc = true
  s.dependency 'Milk'
end
