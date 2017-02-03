Pod::Spec.new do |s|
s.name             = 'AAPickerView'
s.version          = '0.1.0'
s.summary          = 'AAPickerView is simple and easy-to-use implementation for `UITextField` to use as `UIPickerView` and `UIDatePicker` written in swift. '

s.description      = <<-DESC
AAPickerView allows to transform `UITextField` as `UIPickerView` and `UIDatePicker` to pick data easily. It is designed to present a picker view to select data in `UITextField`.
DESC

s.homepage         = 'https://github.com/EngrAhsanAli/AAPickerView'
s.screenshots     = 'https://raw.githubusercontent.com/EngrAhsanAli/AAPickerView/master/Screenshots/AAPickerView.png'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AAPickerView.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

s.source_files = 'AAPickerView/Classes/**/*'

end
