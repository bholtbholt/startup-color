import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dict
import TextInput
import RadioInput
--import CheckboxInput

(=>) : a -> b -> ( a, b )
(=>) a b = ( a, b )

main =
  beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name : String
  , location : String
  , revolutionary : Revolutionary
  , market : String
  , description : Description
  , position : Position
  , color : String
  , disruptedFields : {}
  }

model =
  { name = ""
  , location = ""
  , revolutionary = Yes
  , market = ""
  , description = Airbnb
  , position = ThoughtLeader
  , color = ""
  , disruptedFields =
      Dict.fromList
        [ "advertising" =>
            { name = "Advertising"
            , checked = False
            }
        , "travel" =>
            { name = "Travel"
            , checked = False
            }
        , "utilities" =>
            { name = "Utilities"
            , checked = False
            }
        ]
  }

type Position
  = ThoughtLeader
  | ThoughtFollower

type Revolutionary
  = Yes
  | No

type Description
  = Airbnb
  | Amazon
  | Dropbox
  | Facebook
  | Google
  | Instagram
  | Linkedin
  | Netflix
  | Pinterest
  | Slack
  | Snapchat
  | Spotify
  | Stripe
  | Uber



-- UPDATE

type Msg
  = UpdateName String
  | UpdatePosition Position
  | UpdateMarket String
  | UpdateRevolutionary Revolutionary
  | UpdateDescription Description
  | UpdateLocation String
  | UpdateDisruptedField String Bool
  | UpdateColor


update msg model =
  case msg of
    UpdateName value ->
      { model | name = value }

    UpdateLocation value ->
      { model | location = value }

    UpdateMarket value ->
      { model | market = value }

    UpdatePosition value ->
      { model | position = value }

    UpdateRevolutionary value ->
      { model | revolutionary = value }

    UpdateDescription value ->
      { model | description = value }

    UpdateColor ->
      { model | color = "blue" }

    UpdateDisruptedField checkboxId checked ->
      let
        updateRecord =
          Maybe.map (\checkboxData -> { checkboxData | checked = checked })

        disruptedFieldsUpdated =
          Dict.update checkboxId
          updateRecord
          model.disruptedFields
      in
        { model | disruptedFields = disruptedFieldsUpdated }



-- VIEW

view model =
  let
    checkboxes ( key, data ) =
      label []
        [ input [ type' "checkbox", checked data.checked, onCheck (UpdateDisruptedField key) ] []
        , text data.name
        ]
  in
    div [ class "elm-wrapper" ]
      [ TextInput.view "What is your startup name?" model.name UpdateName
      , TextInput.view "Where are you located?" model.location UpdateLocation
      , TextInput.view "Who are your target users?" model.market UpdateMarket
      , section [ id "revolutionary" ]
        [ h2 [] [ text "Are you revolutionary?"]
        , div [ class "multi-column" ]
          [ RadioInput.view "Yes" "revolutionary" Yes UpdateRevolutionary
          , RadioInput.view "No" "revolutionary" No UpdateRevolutionary
          ]
        ]
      , section [ id "disrupted-fields" ]
        [ h2 [] [ text "What fields are you disrupting?" ]
        , div [ class "multi-column" ]
        (model.disruptedFields |> Dict.toList |> List.map checkboxes)
        ]
      , section [ id "market" ]
        [ h2 [] [ text "Describe your startup:" ]
        , div [ class "multi-column" ]
          [ RadioInput.view ("Airbnb but for " ++ model.market) "description" Airbnb UpdateDescription
          , RadioInput.view ("Amazon but for " ++ model.market) "description" Amazon UpdateDescription
          , RadioInput.view ("Dropbox but for " ++ model.market) "description" Dropbox UpdateDescription
          , RadioInput.view ("Facebook but for " ++ model.market) "description" Facebook UpdateDescription
          , RadioInput.view ("Google but for " ++ model.market) "description" Google UpdateDescription
          , RadioInput.view ("Instagram but for " ++ model.market) "description" Instagram UpdateDescription
          , RadioInput.view ("Linkedin but for " ++ model.market) "description" Linkedin UpdateDescription
          , RadioInput.view ("Netflix but for " ++ model.market) "description" Netflix UpdateDescription
          , RadioInput.view ("Pinterest but for " ++ model.market) "description" Pinterest UpdateDescription
          , RadioInput.view ("Slack but for " ++ model.market) "description" Slack UpdateDescription
          , RadioInput.view ("Snapchat but for " ++ model.market) "description" Snapchat UpdateDescription
          , RadioInput.view ("Spotify but for " ++ model.market) "description" Spotify UpdateDescription
          , RadioInput.view ("Stripe but for " ++ model.market) "description" Stripe UpdateDescription
          , RadioInput.view ("Uber but for " ++ model.market) "description" Uber UpdateDescription
          ]
        ]
      , section [ id "position" ]
        [ h2 [] [ text "Are you a thought-leader or thought-follower?" ]
        , div [ class "multi-column" ]
          [ RadioInput.view "Thought Leader" "position" ThoughtLeader UpdatePosition
          , RadioInput.view "Thought Follower" "position" ThoughtFollower UpdatePosition
          ]
        ]
      , div []
        [ button [ onClick UpdateColor ]
          [ text "Find your color" ]
          , text model.color
        ]
      --, text (toString model)
      ]


-- what's are you valuated at? Hundred Thousands Millions Ten Millions Hundred Millions Billions
-- do you have: exposed brick, glass walls, garage, beer tap, stand up desks, ping-pong tables, xbox, ps4, wiiU, white-board walls, foosball, exposed ceilings, snacks
-- progress bar/counter
-- enter to move to next question
-- autofocus questions
-- before/next buttons
-- loop questions


