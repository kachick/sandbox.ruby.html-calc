require './lib/calc/version'

Gem::Specification.new do |gem|
  # specific

  gem.description   = %q{}

  gem.summary       = gem.description.dup
  gem.homepage      = 'http://kachick.github.com/calc/'
  gem.license       = 'MIT'
  gem.name          = 'calc'
  gem.version       = Calc::VERSION.dup

  gem.required_ruby_version = '>= 2.2'

  gem.add_runtime_dependency 'thor', '~> 0.19'

  gem.add_development_dependency 'yard', '>= 0.8.6.1', '< 0.9'
  gem.add_development_dependency 'rspec', '>= 2.13', '< 3'
  gem.add_development_dependency 'rake', '>= 10', '< 20'
  gem.add_development_dependency 'bundler', '>= 1.3.5', '< 2'

  # common

  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
