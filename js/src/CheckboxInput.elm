module CheckboxInput exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view inputModel action =
  label []
    [ input [ type' "checkbox", checked inputModel.checked, onClick (action inputModel.checked) ] []
    , text inputModel.name
    ]
