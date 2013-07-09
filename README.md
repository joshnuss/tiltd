# Tiltd

A daemon for [Tilt](http://github.com/rtomayko/tilt)

Tilt supports many common template languages such as haml, coffee script and sass.

This gem makes it easy to use these template languages without a lot of setup.

For example if you want to test haml, just create a `index.haml` and run `tiltd` in the same directory.

For demos, check out the `examples` folder

## Installation

    $ gem install tiltd

## Example Usage

    $ cd some-dir
    $ echo '%h1 hello world' > index.haml
    $ echo -e 'body\n\tcolor: blue' > style.css.sass
    $ tiltd -p 9000

    index.haml can be found at http://localhost:9000/
    style.css.sass is at http://localhost:9000/style.css

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
