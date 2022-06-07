module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Ref as Ref
import FRP.Behavior (Behavior, behavior, gate)
import FRP.Event (create, makeEvent, subscribe)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

refToBehavior :: Ref.Ref ~> Behavior
refToBehavior r = behavior \e -> makeEvent \k -> subscribe e \f -> Ref.read r >>=
  (k <<< f)

main :: Effect Unit
main = do
  launchAff_
    $ runSpec [ consoleReporter ] do
      describe "Gate" do
        it "gates" $ liftEffect do
          eio <- create
          rf <- Ref.new false
          n <- Ref.new 0
          let b = refToBehavior rf
          _ <- subscribe (gate b eio.event) \_ -> Ref.modify_ (add 1) n
          eio.push unit
          eio.push unit
          Ref.write true rf
          eio.push unit
          eio.push unit
          eio.push unit
          Ref.write false rf
          eio.push unit
          eio.push unit
          res <- Ref.read n
          shouldEqual res 3