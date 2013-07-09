module Tiltd
  class Application
    def call(env)
      code = 200
      mime = 'text/html'
      body = ''

      headers = {
        'Content-Type'  => mime,
        'Cache-Control' => 'public, max-age=86400'
      }

      [ code, headers, [body] ]
    end
  end
end
