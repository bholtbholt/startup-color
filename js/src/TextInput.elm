module TextInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view inputLabel inputValue action =
  section []
    [ label [] [ text inputLabel ]
    , input [ value inputValue, onInput action ] []
  ]
