<<<<<<< HEAD
prettyTime :: Int -> String
prettyTime totalSeconds = 
    let (hours, remainder) = totalSeconds `divMod` 3600
        (minutes, seconds) = remainder `divMod` 60
        formatUnit value unit
            | value == 1 = show value ++ " " ++ unit
            | value > 1  = show value ++ " " ++ unit ++ "s"
            | otherwise  = ""
        parts = filter (/= "") [formatUnit hours "hour", formatUnit minutes "minute", formatUnit seconds "second"]
    in case parts of
        []       -> "0 seconds"
        [part]   -> part
        [p1, p2] -> p1 ++ " and " ++ p2
        _        -> init (unwords (map (++ ",") parts)) ++ " and " ++ last parts
=======
import Data.List
import System.IO
>>>>>>> dc919a1ab0c61a562237fc750301d80f9eb81c3d

<<<<<<< HEAD
putStr prettyTime 18099
=======
maxInt :: Int
maxInt = 1 :: Int
>>>>>>> dc919a1ab0c61a562237fc750301d80f9eb81c3d