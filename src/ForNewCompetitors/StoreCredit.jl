module StoreCredit

function sc()
    num_testcase = readline(STDIN) |> x->strip(x) |> x->parse(Int64,x)

    i=0
    while (num_testcase>=1)
        i+=1
        c  = readline(STDIN) |> x->strip(x) |> x->parse(Int64,x)
        l  = readline(STDIN) |> x->strip(x) |> x->parse(Int64,x)
        ps = readline(STDIN) |> x->strip(x) |> x->split(x, " ") |> x->map(y->parse(Int64,y),x)
        findinds(c,l,ps,i)
        num_testcase -= 1
    end
    
end

function findinds(c,l,ps,i)
    @assert length(ps) == l
    sort!(ps)
    for i in 1:l-1
        for j in i+1:l
            s = ps[i]+ps[j]
            if s == c
                ind1,ind2 = i,j
            end
        end
    end
    println("Case #$(i): $ind1 $ind2")
end




end
