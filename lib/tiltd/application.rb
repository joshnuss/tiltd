module Tiltd
  class Application
    def call(env)
      request = Rack::Request.new(env)

      if content = Content.locate(request.path_info)
        headers = {
          'Content-Type'  => content.content_type,
          'Cache-Control' => 'public, max-age=86400'
        }
        code = 200
        body = content.body
      else
        code    = 404
        headers = {}
        body    = ''
      end

      [ code, headers, [body] ]
    end
  end
end
