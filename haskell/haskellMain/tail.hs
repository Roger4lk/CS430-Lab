-- tail.hs
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
            -- Get the last n lines and print them
            putStr $ unlines $ takeLast n $ lines content
        _ -> putStrLn "Usage: runhaskell tail.hs <filename> <number of lines>"

-- Helper function to take the last n elements of a list
takeLast :: Int -> [a] -> [a]
takeLast n xs = drop (length xs - n) xs
