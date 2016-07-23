module RadioInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view inputLabel inputName inputValue action =
  label []
    [ input [ type' "radio", name inputName, onClick (action inputValue) ] []
    , text inputLabel
    ]
