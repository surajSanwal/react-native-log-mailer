
Pod::Spec.new do |s|
  s.name         = "RNLogMailer"
  s.version      = "1.0.0"
  s.summary      = "RNLogMailer"
  s.description  = <<-DESC
                  RNLogMailer
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "sonusanwal65@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/surajSanwal/react-native-log-mailer.git", :tag => "master" }
  s.source_files  = "RNLogMailer/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  