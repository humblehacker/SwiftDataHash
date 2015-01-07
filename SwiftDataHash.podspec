Pod::Spec.new do |s|
  s.name         = "SwiftDataHash"
  s.version      = "1.0.0"
  s.summary      = "Swift wrapper around CommonCrypto hash functions"

  s.description  = <<-DESC
                   This library provides a Swift-based wrapper around the
                   MD5, SHA1, SHA224, SHA256, SHA384, and SHA512 cryptographic
                   hash functions, as implemented by the Apple CommonCrypto library.
                   DESC

  s.homepage     = "https://github.com/PodBuilder/SwiftDataHash"
  s.platform     = :osx, '10.10'

  s.license      = "MIT"
  s.author       = "William Kent"

  s.source       = { :git => "https://github.com/PodBuilder/SwiftDataHash.git", :tag => s.version.to_s }
  s.source_files  = "SwiftDataHash/*.{h,m,swift}"
  s.requires_arc  = true
end
