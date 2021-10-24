c      f77 fizzbuzz.f -o fizzbuzz; ./fizzbuzz
       PROGRAM fizzbuzz
       integer num, ii
       num = 100
       
       do 10 ii = 1, num
              if (MOD(ii, 3) .EQ. 0 .AND. MOD(ii, 5) .EQ. 0) then
                     write (*,*) "fizzbuzz"
              elseif (MOD(ii, 3) .EQ. 0) then
                     write (*,*) "fizz"
              elseif (MOD(ii, 5) .EQ. 0) then
                     write (*,*) "buzz"
              else
                     write (*,*) ii
              endif
10     continue
       STOP
       END
