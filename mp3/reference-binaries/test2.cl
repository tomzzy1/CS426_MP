class Main 
{
    main(): Object 
    {
        {
            let i: Int <- 0, 
            x: Int, 
            y: Int, 
            a: Int <- 10, 
            b: Int <- 20 in 
            {
                if a < b then a <- b else b <- a fi;
                while i < 100 loop 
                {
                    x <- a * b;
                    y <- x * i;
                    x <- y + 1;
                    i <- i + 1;         
                } pool;
            };
            self;
        }
    };
};