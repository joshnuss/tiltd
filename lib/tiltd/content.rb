module Tiltd
  class Content
    def self.find(relative)
      relative = relative.gsub(%r{^/}, '')
      path = Dir.glob(relative + '.*').first
      path if path && File.file?(path)
    end

    def self.locate(path)
      actual   = find(path)
      actual   = find(File.join(path, "index")) unless actual

      new(actual) if actual
    end

    def initialize(path)
      @template_class = Tilt[path]
      @template = @template_class.new(path)
    end

    def mime_type
      @template_class.default_mime_type
    end

    def body
      @template.render
    end
  end
end
