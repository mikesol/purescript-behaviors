{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "typelevel-graph"
, dependencies =
  [ "psci-support"
  , "effect"
  , "ordered-collections"
  , "filterable"
  , "nullable"
  , "event"
  , "web-html"
  , "web-events"
  , "web-uievents"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
