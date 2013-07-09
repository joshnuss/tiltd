module Tiltd
  class Content
    def self.find(path)
      Dir.glob(path + '.*').first
    end

    def self.locate(path)
      relative = path.gsub(%r{^/}, '')
      actual   = find(relative)
      actual   = find(relative + "/index") unless actual

      new(actual) if actual
    end
  end
end
