module CheckboxInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view key data action =
  label []
    [ input [ type' "checkbox", checked data.checked, onCheck (action key) ] []
    , text data.name
    ]
