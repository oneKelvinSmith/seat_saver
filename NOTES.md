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

## [Post #6](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-18-phoenix-elm-6.md)

First thing I stumbled with here was the type annotation syntax for a function that takes multiple arguments i.e. `function : first -> second -> result`. I've since learned that it's got to do with currying(partial function application) and I can think of the signature as saying that 'this is a function that takes `first` and returns a function that takes `second` which then returns the `result`'. Here is a decent [article on currying](http://andrewberls.com/blog/post/partial-function-application-for-humans).

In the example of
```elm
type Msg = Toggle Seat
```
You could talk about how `Toggle` is not a separate type but a 'type constructor' or 'tag' that takes an argument of type `Seat`. `Toggle Seat` is a value of the `Msg` type. It's kind of like an enum and helps to make pattern matching on the `Msg` type easier. This stuff is still quite fuzzy for me.

<aside>I'm annoyed that they've started using shortened names for things like `Msg` instead of `Message`. It seems inconsistent and unnecessary.</aside>


Code was all :thumbsup:. I used `Message` instead of `Msg`...
```elm
module SeatSaver exposing (..)

import Html            exposing (..)
import Html.Attributes exposing (class)
import Html.Events     exposing (onClick)

import Html.App as Html

main : Program Never
main =
  Html.beginnerProgram
    { model = init
    , update = update
    , view = view }


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


-- UPDATE

type Message = Toggle Seat

update : Message -> Model -> Model
update message model =
  case message of
    Toggle seatToToggle ->
      let
        updateSeat seatFromModel =
          if seatFromModel.seatNo == seatToToggle.seatNo then
            { seatFromModel | occupied = not seatFromModel.occupied }
          else
            seatFromModel
      in
        List.map updateSeat model


-- VIEW

view : Model -> Html Message
view model =
  ul [ class "seats" ](List.map seatItem model)

seatItem : Seat -> Html Message
seatItem seat =
  let
    occupiedClass =
      if seat.occupied then "occupied" else "available"
  in
    li
      [ class ("seat " ++ occupiedClass)
      , onClick (Toggle seat)
      ]
      [ text (toString seat.seatNo) ]
```

[Post #7](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-10-30-phoenix-elm-7.md)
[Post #8](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-04-phoenix-elm-8.md)
[Post #9](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-05-phoenix-elm-9.md)
[Post #10](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-24-phoenix-elm-10.md)
[Post #11](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2015-11-26-phoenix-elm-11.md)
[Post #12](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-01-24-phoenix-elm-12.md)
[Post #13](https://github.com/CultivateHQ/cultivateHQ.com/blob/elm-0-17-update/source/posts/2016-02-15-phoenix-elm-13.md)
