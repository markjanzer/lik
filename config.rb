# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Use Sprockets for asset pipeline
require "sprockets/es6"
activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

# Live Reload
# activate :livereload
# Secret storage
activate :dotenv
# Pretty URLs
activate :directory_indexes

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# This gets rid of the wave of duplicate key warnings.
Middleman::Util::EnhancedHash.disable_warnings

require "import_data.rb"
require "intervals_shapes.rb"
require "helpers.rb"
require "progress.rb"

data.practice_sessions.each do |practice_session|
  proxy "/practice-sessions/#{practice_session.id}/index.html", "/practice-sessions/show.html", :locals => { :practice_session => practice_session }, layout: "layout", :ignore => true
end

# Articles use article layout, except for index
page "/articles/*", :layout => "article-layout"
page "/reflections/*", :layout => "article-layout"

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  # https://cobwwweb.com/render-inline-svg-rails-middleman
  def svg(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end
end

configure :development do
  config[:base_url] = "http://localhost:4567"
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  config[:base_url] = "https://likeyboard.io"

  import_data

  if data[:intervals_shapes].nil?
    generate_elements_json
  end

  # Enable cache buster
  activate :asset_hash, exts: %w(.js .css)
  # activate :asset_hash

  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # GZIP files for even better compression
  activate :gzip, exts: %w(.js .css .html .htm .xml .txt)
end