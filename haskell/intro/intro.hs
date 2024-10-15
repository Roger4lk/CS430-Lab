import System.Enviourment
import Data.List

stringToInts :: [String] -> [Int]
stringToInts strings = 
    if null strings then
        []
    else 
        (read (head strings) :: Int) : stringsToInts (tail Strings)


main = do
    args <- getArgs
    let sortedArgs = sort $ stringsToInts args 
    print sortedArgs
