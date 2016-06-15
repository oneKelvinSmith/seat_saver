# Notes

Some comments but mostly updated code snippets that worked for me.

## [Post #1](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-15-phoenix-elm-1.md)

Versions I'm testing on (Latest of everything as of 14 June 2016).

* elixir:   1.2.6
* elm:      0.17.0
* phoenix:  1.1.6
* postgres: 9.5.3

:thumbsup:


## [Post #2](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-15-phoenix-elm-2.md)

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
/web/elm/elm.js
/web/elm/index.html
/web/static/vendor/
```

## [Post #3](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-16-phoenix-elm-3.md)

Following convention of previous suggestions
```elm
main : Html string
main =
  view


-- VIEW

view : Html string
view =
  text "Woo hoo, I'm in a view"

```

## [Post #4](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-16-phoenix-elm-4.md)

I reversed the `Seat` type alias because that's how it shows up in compile errors/messages.
```elm
  { occupied : Bool
  , seatNo : Int
  }
```

Init function with reversed records and type signature.
```elm
init : Model
init =
  [ { occupied = False, seatNo = 1 }
  , { occupied = False, seatNo = 2 }
  , { occupied = False, seatNo = 3 }
  , { occupied = False, seatNo = 4 }
  , { occupied = False, seatNo = 5 }
  , { occupied = False, seatNo = 6 }
  , { occupied = False, seatNo = 7 }
  , { occupied = False, seatNo = 8 }
  , { occupied = False, seatNo = 9 }
  , { occupied = False, seatNo = 10 }
  , { occupied = False, seatNo = 11 }
  , { occupied = False, seatNo = 12 }
  ]
```

Overview after adding model.
```elm
module SeatSaver exposing (..)

import Html exposing (Html, text)


main : Html string
main =
  view


-- MODEL

type alias Seat =
  { occupied : Bool
  , seatNo : Int
  }

type alias Model =
  List Seat

init : Model
init =
  [ { occupied = False, seatNo = 1 }
  , { occupied = False, seatNo = 2 }
  , { occupied = False, seatNo = 3 }
  , { occupied = False, seatNo = 4 }
  , { occupied = False, seatNo = 5 }
  , { occupied = False, seatNo = 6 }
  , { occupied = False, seatNo = 7 }
  , { occupied = False, seatNo = 8 }
  , { occupied = False, seatNo = 9 }
  , { occupied = False, seatNo = 10 }
  , { occupied = False, seatNo = 11 }
  , { occupied = False, seatNo = 12 }
  ]


-- VIEW

view : Html string
view =
  text "Woo hoo, I'm in a view"
```

`main` function after passing model to view.
```elm
main : Html any
main =
  view init
```

`view` function after adding model as argument.
```elm
-- VIEW

view : Model -> Html any
view model =
  ul [ class "seats" ](List.map seatItem model)

seatItem : Seat -> Html any
seatItem seat =
  li [ class "seat available" ] [ text (toString seat.seatNo) ]

```
and the updated imports.
```elm
import Html exposing (Html, text, ul, li)
import Html.Attributes exposing (class)

```

## [Post #5](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-18-phoenix-elm-5.md)

So, it looks like I jumped the gun with type annotations. One thing that would be useful is a short discussion about 'type variables' like `a`. Which appears in all the compiler messages and I think is short for 'alpha' from some type theory book/paper. I used 'any' and 'string' in places  because it felt more familiar.

Maybe also add a link to [Types in the Guide](http://guide.elm-lang.org/types/)?

Otherwise :thumbsup:

[Post #6](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-18-phoenix-elm-6.md)
[Post #7](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-30-phoenix-elm-7.md)
[Post #8](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-04-phoenix-elm-8.md)
[Post #9](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-05-phoenix-elm-9.md)
[Post #10](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-24-phoenix-elm-10.md)
[Post #11](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-26-phoenix-elm-11.md)
[Post #12](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-01-24-phoenix-elm-12.md)
[Post #13](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-02-15-phoenix-elm-13.md)
