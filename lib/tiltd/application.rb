module Tiltd
  class Application
    def call(env)
      request = Rack::Request.new(env)
      headers = {}

      if content = Content.locate(request.path_info)
        headers['Content-Type'] = content.mime_type
        code = 200
        body = content.body
      el
        code = 404
        body = ''
      end

      [ code, headers, [body] ]
    end
  end
end
