# Notes

[Post #1](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-15-phoenix-elm-1.md)

Versions I'm testing on. Latest of everything as of 14 June 2016.

elixir:   1.2.6
elm:      0.17.0
phoenix:  1.1.6
postgres: 9.5.3

:thumbsup:


[Post #2](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-15-phoenix-elm-2.md)

Saw a compile warning here.
```
I ran into something unexpected when parsing your code!

1| module SeatSaver where
                    ^
I am looking for one of the following things:

    something like `exposing (..)` which replaced `where` in 0.17
    whitespace
```

This is more in line with the tutorials on elm-lang.
```elm
module SeatSaver exposing (..)

import Html exposing (Html, text)

main : Html string
main =
  text "Hello from Elm"

```

The brunch config code sample might want to use single quotes consistently.
```js
// brunch-config.json
{
  ...
  paths: {
    watched: [
      ...
      'test/static',
      'web/elm/SeatSaver.elm'
    ],
    ...
  },

  plugins: {
    elmBrunch: {
      elmFolder: 'web/elm',
      mainModules: ['SeatSaver.elm'],
      outputFolder: '../static/vendor'
    },
    ...
  },
  ...
}
```

The js code I needed to embed successfully and make `standard` happy.
```js
/* global Elm */

const elmDiv = document.getElementById('elm-main')

Elm.SeatSaver.embed(elmDiv)
```

I also added some rules to my `.gitignore` to have less stuff in git.
```git
# Elm stuff
/web/elm/elm-stuff/
/web/static/vendor/
```


[Post #3](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-16-phoenix-elm-3.md)
[Post #4](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-16-phoenix-elm-4.md)
[Post #5](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-18-phoenix-elm-5.md)
[Post #6](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-18-phoenix-elm-6.md)
[Post #7](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-30-phoenix-elm-7.md)
[Post #8](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-04-phoenix-elm-8.md)
[Post #9](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-05-phoenix-elm-9.md)
[Post #10](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-24-phoenix-elm-10.md)
[Post #11](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-26-phoenix-elm-11.md)
[Post #12](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-01-24-phoenix-elm-12.md)
[Post #13](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-02-15-phoenix-elm-13.md)
