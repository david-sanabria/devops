#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'

app_name = ENV['APP_NAME']
yaml_filename = "#{ENV['ENVIRONMENT_NAME']}.yaml"
version = ENV['VERSION']

`git clone --depth=1 git@github.com:ca-cwds/cws-cares.git`
Dir.chdir('cws-cares') do
  puts "Updating the manifest for #{ENV['ENVIRONMENT_NAME']} with this version: #{version}"
  yaml_file = File.open(yaml_filename)
  manifest = YAML.safe_load(yaml_file) || {}
  manifest[app_name] = version

  File.open(yaml_filename, 'w') do |h|
    h.write manifest.to_yaml
  end

  `git add #{yaml_filename}`
  `git commit -m "Automatic #{app_name} version update on #{yaml_filename}"`
  `git push origin`
end
`rm -rf cws-cares`