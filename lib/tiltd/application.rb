module Tiltd
  class Application
    def call(env)
      path = find_path(env)

      if content = Content.locate(path)
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

  private
    def find_path(env)
      request = Rack::Request.new(env)
      request.path_info[1..-1]
    end
  end
end
