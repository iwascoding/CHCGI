Pod::Spec.new do |s|
  s.name         = "CHCGI"
  s.version      = "0.0.1"
  s.summary      = "Base class for stand-alone CGIs for cocoahub server."
  s.description  = "Base class for stand-alone CGIs for cocoahub server."
  s.homepage     = "https://github.com/iwascoding/CHCGI"

  s.license      = 'MIT (example)'
  s.author       = { "Ilja A. Iwas" => "ilja@iwacoding.com" }
  s.source       = { :git => "https://github.com/iwascoding/CHCGI.git" }
  s.source_files = '*.{h,m}'

  s.requires_arc = true
end
