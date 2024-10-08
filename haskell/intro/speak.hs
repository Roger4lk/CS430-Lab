import System.Environmentgch
import System.Process

spell :: String -> IO ()
spell phrase = 
    if null phrase then
        return ()
    else do
        let first = head phrase
        system $ "say" ++ [fisrt]
        spell $ tail phrase

main = do
    args <- getArgs
    let phrase = head args
    spell args