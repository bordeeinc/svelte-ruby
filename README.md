# svelte-ruby

Ruby Gem wrapper for the [Svelte compiler][svelte_compiler]

  [svelte_compiler]: https://github.com/sveltejs/svelte

[![Gem Version](https://badge.fury.io/rb/svelte-ruby.svg)](https://badge.fury.io/rb/svelte-ruby)

## Usage

```
require 'svelte'

Svelte.exec_eval('svelte.VERSION')
# => '1.12.1'

Svelte.exec_method('svelte.compile', '<h1>Hello {{name}}</h1>')
# => {code: 'function renderMainFragment ( root, component ) { [...], map: [...]}
```

## Installation

Command Line

```
gem install svelte-ruby
```

Gemfile

```
gem "svelte-ruby", "~>0.1"
```

## Development

### Svelte Source

https://svelte.technology

The svelte-ruby gem ships with a working svelte source: `lib/svelte.js`. No need to regenerate it except for development or configuration.

The rollup task transpiles the svelte source to a format that's compatible with Execjs. The result is written to `lib/svelte.js` with these commands:

```
cp lib/rollup/rollup.config.ruby svelte
cd svelte
rollup -c rollup.config.ruby.js
```

You will also need to replace `self.performance.now()` in the generated JS with `null`;

### Dev Requirements

* [npm rollup] is needed locally to regenerate the svelte source for Execjs

   [npm rollup]: https://www.npmjs.com/package/rollup

### Testing

Tests written with [minitest]

```
bundle exec rake test
```

  [minitest]: https://github.com/seattlerb/minitest

### Contributing

Send tested code.
Thank you, [contributors]!

  [contributors]: https://github.com/bordeeinc/svelte-ruby/graphs/contributors

### To Do

* Finish command line `bin/svelte`

## License

MIT License

Copyright (c) 2017 Bordee Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## About

![bordee](http://bordee.com/src/img/surf-with-bordee-github.png)

svelte-ruby is maintained and funded by Bordee Inc.
The names and logos for Bordee are trademarks of [Bordee Inc.][bordeeinc]

  [bordeeinc]: http://bordee.com

We love open source software!
See [our other projects][bordee-github]
and [check out Seattle.rb!][community]

  [bordee-github]: https://github.com/bordeeinc
  [community]: https://seattlerb.org
