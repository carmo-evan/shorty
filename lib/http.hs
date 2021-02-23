{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
module HTTP where

import Data.Text
import Data.Time (UTCTime)
import Servant
import Network.Wai
import Network.Wai.Handler.Warp
import           Data.Aeson
import           GHC.Generics

type ShortenAPI = "shorten" :> QueryParam "url" String :> Post '[PlainText] String
shortenAPI :: Proxy ShortenAPI
shortenAPI = Proxy

server :: Server ShortenAPI
server = shorten

shorten :: String -> String
shorten = return "yay"

app :: Application
app = serve shortenAPI server