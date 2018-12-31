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

Airrecord.api_key = ENV["AIRRECORD_API_KEY"]
require "intervals_shapes.rb"
require "import_data.rb"
require "progress.rb"


data.practice_sessions.each do |practice_session|
  proxy "/practice-sessions/#{practice_session.id}/index.html", "/practice-sessions/show.html", :locals => { :practice_session => practice_session }, layout: "layout", :ignore => true
end

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

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end