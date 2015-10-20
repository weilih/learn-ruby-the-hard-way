# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshif(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = "NAME"
  spec.version = '1.0'
  spec.authors = ['Your Name Here']
  spec.email = ['youremail@example.com']
  spec.summary = %q{short summary of your project}
  spec.description = %q{long description of your project}
  spec.homepage = "http://www.example.com/"
  spec.license = "MIT"

  spec.files = ['lib/NAME.rb']
  spec.executables = ['bin/NAME']
  sepc.test_files = ['tests/test_NAME.rb']
  spec.require_paths = ["lib"]
end
