module Tiltd
  class Application
    def call(env)
      request = Rack::Request.new(env)
      headers = {}

      if File.exists?(request.path_info.gsub(%r{^/}, ''))
        return Rack::File.new(Dir.pwd).call(env)
      elsif content = Content.locate(request.path_info)
        headers['Content-Type'] = content.mime_type
        code = 200
        body = content.body
      else
        code = 404
        body = ''
      end

      [ code, headers, [body] ]
    end
  end
end
