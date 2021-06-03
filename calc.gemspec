require './lib/calc/version'

Gem::Specification.new do |gem|
  # specific

  gem.description   = %q{}

  gem.summary       = gem.description.dup
  gem.homepage      = 'http://kachick.github.com/calc/'
  gem.license       = 'MIT'
  gem.name          = 'calc'
  gem.version       = Calc::VERSION

  gem.required_ruby_version = '>= 3.0.1'

  gem.add_runtime_dependency 'rack', '>= 2.2.3', '< 3.0.0'
  gem.add_runtime_dependency 'puma'

  # common

  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ['lib']
end
