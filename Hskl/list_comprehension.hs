main :: IO ()
main = do
    print "Hello world"
    let l = [1,2,3,4,5]
    print (map successor l)
    print (foldl (*) 1 l)
    print (foldl (addInt) 0 l)

successor :: Int -> Int
successor x = x + 1

addInt :: Int -> Int -> Int
addInt x y = x + y

