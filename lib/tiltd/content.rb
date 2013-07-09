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

    def initialize(path)
      @template_class = Tilt[path]
      @template = @template_class.new(path)
    end

    def content_type
      @template_class.default_mime_type
    end

    def body
      @template.render
    end
  end
end
