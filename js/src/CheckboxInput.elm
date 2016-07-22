module CheckboxInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view inputValue =
  label []
    [ input [ type' "checkbox", value inputValue ] []
    , text inputValue
    ]
