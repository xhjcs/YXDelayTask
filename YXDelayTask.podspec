Pod::Spec.new do |s|
  s.name                = 'YXDelayTask'
  s.summary             = 'Support for the cancellation of the delayed task framework.'
  s.version             = '1.0.0'
  s.homepage            = 'https://github.com/xinghanjie/YXDelayTask'
  s.license             = { :type => 'MIT', :file => 'LICENSE'}
  

  s.author               = { 'Heikki' => 'xinghanjie@gmail.com' }
  s.platform             = :ios, '7.0'
  s.source               = { :git => 'https://github.com/xinghanjie/YXDelayTask.git', :tag => s.version }
  s.source_files         = 'YXDelayTask/*.{h,m}'
  s.requires_arc         = true
  s.public_header_files  = 'YXDelayTask/*.{h}'

end


