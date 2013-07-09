guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/tiltd/#{m[1]}_spec.rb" }
  watch('lib/tiltd.rb')         { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end
