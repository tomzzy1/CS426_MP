class Main 
{
    main(): Object 
    {
        {
            let i: Int <- 0, x: Int <- 0, y:Int <-0 in 
            {
                while i < 100 loop 
                {
                    if 2 > 3 then i else 
                    i <- i + 1;

                } pool;
            };
            self;
        }
    };
};