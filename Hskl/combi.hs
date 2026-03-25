import Data.List (sortBy)
import Data.Ord (comparing)

type Op = (String, Double -> Double)

ops :: [Op]
ops =
  [ ("A", \x -> x / 2.0)
  , ("B", \x -> x - 900)
  , ("C", \x -> x + 2000)
  , ("D", \x -> x * 5)
  , ("E", \x -> x + 500)
  ]

target :: Double
target = 3000

maxDepth :: Int
maxDepth = 6

dfs :: Double -> [String] -> Int -> [[String]]
dfs x path depth
  | depth > maxDepth = []
  | x == target = [path]
  | x < -10000 || x > 10000 = []
  | otherwise =
      concat [ dfs (f x) (path ++ [name]) (depth + 1)
             | (name, f) <- ops
             ]

results :: [[String]]
results = dfs 0 [] 0

-- sort by length, then lexicographically
sortedResults :: [[String]]
sortedResults =
  sortBy cmp results
  where
    cmp a b =
      compare (length a) (length b)
      <> compare (concat a) (concat b)

main :: IO ()
main = mapM_ (putStrLn . concat) sortedResults