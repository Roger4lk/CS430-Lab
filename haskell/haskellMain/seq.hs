-- seq.hs
import System.Environment (getArgs)

-- Main function
main :: IO ()
main = do
    -- Get command-line arguments
    args <- getArgs
    
    -- Ensure two arguments are provided
    case args of
        [startStr, endStr] -> do
            let start = read startStr :: Int
            let end = read endStr :: Int
            -- Determine the delta based on the direction of the sequence
            let delta = if start <= end then 1 else -1
            -- Generate and print the sequence
            printSeq start end delta
        _ -> putStrLn "Usage: runhaskell seq.hs <start> <end>"

-- Helper function to recursively print the sequence
printSeq :: Int -> Int -> Int -> IO ()
printSeq current target delta = do
    -- Print the current value
    print current
    -- Continue if the current value hasn't reached the target
    if current /= target
        then printSeq (current + delta) target delta
        else return ()
