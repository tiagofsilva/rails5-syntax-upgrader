lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ruby_syntax_upgrader"
  spec.version       = '0.1.2'
  spec.authors       = ["Tiago Farias Silva"]
  spec.email         = ["aeroboom@gmail.com"]
  spec.summary       = %q{A few Rake tasks to upgrade Ruby and Rails syntax on a project(Ruby 2.3 and Rails 5)}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "http://rubygems.org/gems/ruby-syntax-upgrader"
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "pry", "~> 0.10"
end
