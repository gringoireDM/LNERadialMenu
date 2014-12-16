
Pod::Spec.new do |s|

  s.name         = "LNERadialMenu"
  s.version      = "0.0.1"
  s.summary      = "A radial menu that considers also screen edges."

  s.description  = <<-DESC
                   A radial menu that considers also screen edges, reorganizing buttons in order to get them always inside the screen.
                   DESC

  s.license      = { :type => 'MIT' }
  s.homepage = "https://github.com/gringoireDM/LNERadialMenu.git"

  s.author             = { "Giuseppe Lanza" => "gringoire986@gmail.com" }
  s.social_media_url   = "http://twitter.com/gringoireDM"
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source       = { :git => "https://github.com/gringoireDM/LNERadialMenu.git", :tag => "0.0.1" }

  s.source_files  = "LNERadialMenu/RadialMenu", "LNERadialMenu/RadialMenu/*.{h,m}", "LNERadialMenu/RadialMenu/**/*.{h,m}"

end
