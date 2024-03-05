class Main 
{
    main(): Object 
    {
        {
            let i: Int <- 0, j: Int <- 0 in 
            {
                while i < 100 loop 
                {
                    i <- i + 1;
                    let k: Int <- 0 in
                        while k < 200 
                        loop 
                            k <- k + 4 
                        pool;            
                } pool;
                while j < 50 
                loop
                    j <- j + 1
                pool;
            };
            self;
        }
    };
};