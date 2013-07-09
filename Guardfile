guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/tiltd/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch('lib/tiltd.rb')           { "spec" }
  watch('spec/spec_helper.rb')    { "spec" }
end
