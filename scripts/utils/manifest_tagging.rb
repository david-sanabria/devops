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

  `git config user.email "automated@jenkins.cwds.io"`
  `git config user.name "Jenkins automated manifest tagging system"`
  `git add #{yaml_filename}`
  `git commit -m "Automatic #{app_name} version update on #{yaml_filename}"`

  `docker build -t cws-cares-ci .`
  exec("docker run --rm -v /opt/jenkins/workspace/Integration\ Environment/intake-app-pipeline/cws-cares:/usr/src/app/ cws-cares-ci")
end
