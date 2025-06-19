require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name             = 'LibDiveComputerPlugin'
  s.version          = package['version']
  s.summary          = package['description']
  s.license          = package['license']
  s.homepage         = package['repository']['url']
  s.author           = package['author']
  s.source           = { :git => package['repository']['url'], :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.dependency 'Capacitor'
  s.swift_version = '5.1'

  # Include Swift plugin, Objective-C wrapper, and libdc C sources/headers
  s.source_files = [
    'ios/Sources/LibDiveComputerPlugin/**/*.swift',
    'ios/Sources/LibDiveComputerPlugin/LibDiveComputerWrapper.{h,m}',
    'ios/libdc/config.h',
    'ios/libdc/revision.h',
    'ios/libdc/src/**/*.c',
    'ios/libdc/src/**/*.h',
    'ios/libdc/include/**/*.h'
  ]

  # Public headers
  s.public_header_files = [
    'ios/libdc/include/**/*.h',
    'ios/libdc/config.h',
    'ios/libdc/src/**/*.h',
    'ios/libdc/revision.h'
  ]

  # Mappa le cartelle di header
  s.header_mappings_dir = 'ios/libdc'

  # Compile C code directly into the plugin framework
  s.pod_target_xcconfig = {
    # Ensure both include and src are searched for headers
    'HEADER_SEARCH_PATHS' => '"$(PODS_TARGET_SRCROOT)/ios/libdc/include" "$(PODS_TARGET_SRCROOT)/ios/libdc/src"',
    'DEFINES_MODULE'      => 'YES'
  }

  # Non compilare i sorgenti Windows e usb su iOS
  s.exclude_files =  [
    'ios/libdc/src/**/*win32*.c',
    'ios/libdc/src/**/*usb*.c'
  ]
end
