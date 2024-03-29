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
