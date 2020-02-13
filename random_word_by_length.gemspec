lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "random_word_by_length/version"

Gem::Specification.new do |spec|
  spec.name          = "random_word_by_length"
  spec.version       = RandomWordByLength::VERSION
  spec.authors       = ["Neil"]
  spec.email         = ["neilmarkoliverryan@gmail.com"]

  spec.summary       = %q{Generates random words by length}
  spec.description   = %q{A RUBY CLI GEM for generating random words by length with description and other details.}
  spec.homepage      = "https://github.com/neilmryan/random_word_by_length"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://rubygems.org/profiles/neilmryan"
  spec.metadata["changelog_uri"] = "https://github.com/neilmryan/random_word_by_length"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
