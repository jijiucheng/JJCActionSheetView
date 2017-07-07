
Pod::Spec.new do |s|

    s.name          = 'JJCActionSheetView'
    s.version       = '0.0.1'
    s.license       = 'MIT'
    s.summary       = 'A Library for iOS to show ActionSheetView.'
    s.homepage      = 'https://github.com/jijiucheng/JJCActionSheetView'
    s.authors       = { '苜蓿鬼仙' => '302926124@qq.com' }
    s.source        = { :git => 'https://github.com/jijiucheng/JJCActionSheetView.git', :tag => s.version }
    s.source_files  = 'JJCActionSheetView/*.{h,m}'
    s.framework     = 'UIKit'
    s.requires_arc  = true
    s.platform      = :ios

end
