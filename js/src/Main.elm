import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import TextInput
import RadioInput
import CheckboxInput

main =
  beginnerProgram { model = model, view = view, update = update }

model =
  { name = ""
  , location = ""
  , revolutionary = Yes
  , market = ""
  , description = Airbnb
  , position = ThoughtLeader
  , color = ""
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


view model =
  div [ class "elm-wrapper" ]
    [ text (toString model)
    , TextInput.view "What is your startup name?" model.name UpdateName
    , TextInput.view "Where are you located?" model.location UpdateLocation
    , TextInput.view "Who are your users?" model.market UpdateMarket
    , section []
      [ h2 [] [ text "Are you revolutionary?"]
      , div [ class "multi-column" ]
        [ RadioInput.view "Yes" "revolutionary" Yes UpdateRevolutionary
        , RadioInput.view "No" "revolutionary" No UpdateRevolutionary
        ]
      ]
    , section []
      [ h2 [] [ text "What fields are you disrupting?" ]
      , div [ class "multi-column" ]
        [ CheckboxInput.view "Advertising"
        , CheckboxInput.view "Travel"
        , CheckboxInput.view "Utilities"
        ]
      ]
    , section []
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
    , section []
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
    ]


-- what's are you valuated at? Hundred Thousands Millions Ten Millions Hundred Millions Billions
-- do you have: exposed brick, glass walls, garage, beer tap, stand up desks, ping-pong tables, xbox, ps4, wiiU, white-board walls, foosball, exposed ceilings, snacks

type Msg =
    UpdateName String
  | UpdatePosition Position
  | UpdateMarket String
  | UpdateRevolutionary Revolutionary
  | UpdateDescription Description
  | UpdateLocation String
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
