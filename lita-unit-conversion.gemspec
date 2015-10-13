Gem::Specification.new do |spec|
  spec.name          = 'lita-unit-conversion'
  spec.version       = '0.1.0'
  spec.authors       = ['Robert James Kaes']
  spec.email         = ['rjk@wormbytes.ca']
  spec.summary       = 'Lita handler to perform unit conversions using ruby-unit.'
  spec.homepage      = 'https://github.com/rjkaes/lita-unit-conversion'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'extension' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.6'
  spec.add_runtime_dependency 'ruby-units', '~> 1.4.5'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'mock_redis', '~> 0.15.3'
end
