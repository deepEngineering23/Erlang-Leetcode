-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].

index(L,K,I,Nums, Target)->
    Y = lists:nth(K,L),
    Z = lists:nth(I,Nums),
    if 
        Y == Z  -> [K-1,I-1];
        Y /= Z  -> index(L,K+1,I,Nums, Target)
    end.

forfun(L,I,Nums, Target) ->
    P = lists:member(lists:nth(I,Nums),L),
    if 
        P == true  -> Index = index(L,1,I,Nums, Target);
        P == false -> 
            R = L ++ [Target-lists:nth(I,Nums)],
            forfun(R,I+1,Nums, Target)
    end.


two_sum(Nums, Target) -> Ans = forfun([],1,Nums, Target).
