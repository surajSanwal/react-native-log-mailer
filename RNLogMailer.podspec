require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "RNLogMailer"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = package["description"]
  s.homepage     = "https://github.com/surajSanwal/react-native-log-mailer.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Suraj Sanwal" => "sonusanwal65@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/surajSanwal/react-native-log-mailer.git", :tag => "#{s.version}" }
  s.source_files  = "RNLogMailer/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  