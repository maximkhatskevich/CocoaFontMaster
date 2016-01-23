Pod::Spec.new do |s|

  s.name                      = 'CocoaFontMaster'
  s.version                   = '1.0.0'
  s.summary                   = 'Project-wide dynamic fonts configuration for UI controls made simple in Xcode'
  s.homepage                  = 'https://github.com/maximkhatskevich/#{s.name}'

  s.license                   = { :type => 'MIT', :file => 'LICENSE' }

  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }

  s.ios.deployment_target     = '8.0'
  # s.osx.deployment_target     = '10.9'
  # s.tvos.deployment_target    = '9.0'
  # s.watchos.deployment_target = '2.0'

  s.source                    = { :git => '#{s.homepage}.git', :tag => '#{s.version}' }
  
  s.ios.source_files              = 'Src/iOS/*.swift'
  # s.osx.source_files              = 'Src/OSX/*.swift'

  s.requires_arc              = true

  s.social_media_url          = 'http://www.linkedin.com/in/maximkhatskevich'

end
