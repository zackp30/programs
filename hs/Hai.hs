module Stuff.Pls

import Options.Applicative

stuff :: Stuff -> IO ()
stuff = putStrLn "Hai!"


main :: IO ()
main = execParser opts >>= stuff
    where
        opts = info (helper <*> stuff)
                ( fullDesc
                <> progDesc "Stuff"
                <> header "Hai!" )
