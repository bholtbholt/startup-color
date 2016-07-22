module RadioInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view inputLabel inputName inputValue msg =
  label []
    [ input [ type' "radio", name inputName, onClick (msg inputValue) ] []
    , text inputLabel
    ]
