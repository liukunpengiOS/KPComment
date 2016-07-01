
Pod::Spec.new do |s|

s.name         = "KPComment"
s.version      = "0.0.2"
s.summary      = "simple view for commnet."
s.homepage     = "https://github.com/liukunpengiOS/KPComment"
s.license      = "MIT"
s.author       = { "kunpeng" => "1169405067@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/liukunpengiOS/KPComment.git", :tag => "0.0.2" }
s.source_files = "KPComment/**/*.{h,m}"
s.requires_arc = true
s.dependency "KPMaskView"
end