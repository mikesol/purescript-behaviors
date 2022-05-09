{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "typelevel-graph"
, dependencies =
  [ "control"
  , "datetime"
  , "effect"
  , "either"
  , "event"
  , "filterable"
  , "foldable-traversable"
  , "lists"
  , "maybe"
  , "newtype"
  , "ordered-collections"
  , "partial"
  , "prelude"
  , "refs"
  , "tuples"
  , "web-events"
  , "web-html"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
