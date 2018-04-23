#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

app_name = ENV['APP_NAME']
yaml_filename = "#{ENV['ENVIRONMENT_NAME']}.yaml"
version = ENV['VERSION']

Dir.chdir('cws-cares') do
  puts "Updating the manifest for #{ENV['ENVIRONMENT_NAME']} with this version: #{version}"
  yaml_file = File.open(yaml_filename)
  manifest = YAML.load(yaml_file) || {}
  manifest[app_name] = version

  File.open(yaml_filename, 'w') do |h|
    h.write manifest.to_yaml
  end

  `docker build -t cws-cares-ci .`
  exec("docker run --rm -v $(pwd):/usr/src/app/ cws-cares-ci")
end
