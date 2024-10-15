-- head.hs
import System.Environment (getArgs)
import System.IO (readFile)

-- Main function
main :: IO ()
main = do
    -- Get command-line arguments
    args <- getArgs
    
    -- Ensure the correct number of arguments are provided
    case args of
        [fileName, numLines] -> do
            -- Read the file content
            content <- readFile fileName
            -- Convert numLines from string to an integer
            let n = read numLines :: Int
            -- Get the first n lines and print them
            putStr $ unlines $ take n $ lines content
        _ -> putStrLn "Usage: runhaskell head.hs <filename> <number of lines>"
