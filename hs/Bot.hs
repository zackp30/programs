import Network
import System.IO
import Text.Printf

server = "irc.apertron.net"
port = 6667
chan = "#GET_MAD"
nick = "amghai"

main = do
    h <- connectTo server (PortNumber (fromIntegral port))
    hSetBuffering h NoBuffering
    t <- hGetContents h
    print t

{-
 -main = do
 -        putStrLn "Starting..."
 -        h <- connectTo server (PortNumber (fromIntegral port))
 -        hSetBuffering h NoBuffering
 -        t <- hGetContents h
 -        listen h
 -        print t
 -        putStrLn "Started."
 -        write h "NICK" nick
 -        write h "USER" (nick++" 0 * :stuff")
 -        write h "JOIN" chan
 -        putStrLn "Started."
 -
 -write :: Handle -> String -> String -> IO ()
 -write h s t = do
 -        hPrintf h "%s %s\r\n" s t
 -        printf "> %s %s\n" s t
 -
 -listen :: Handle -> IO ()
 -listen h = forever $ do
 -    s <- hGetLine h
 -    putStrLn s
 -    where
 -        forever a = do a ; forever a
 -}
