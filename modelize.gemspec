Gem::Specification.new do |s|
  s.name        = 'modelize'
  s.version     = '0.1.0'
  s.date        = '2017-01-05'
  s.summary     = "Modelize MongoDB Documents"
  s.description = "Automatically turn MongoDB BSON Documents into custom models"
  s.authors     = ["Fugroup Limited"]
  s.email       = 'mail@fugroup.net'

  s.add_runtime_dependency 'mongo', '~> 2.2'
  s.add_development_dependency 'futest', '>= 0'
  s.add_development_dependency 'minimongo', '>= 0'

  s.homepage    = 'https://github.com/fugroup/modelize'
  s.license     = 'MIT'

  s.require_paths = ['lib']
  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
end
