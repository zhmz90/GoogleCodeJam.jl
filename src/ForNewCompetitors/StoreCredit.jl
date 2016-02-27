module StoreCredit

function sc()
    fl = open("A-large-practice.in")
    num_testcase = readline(fl) |> x->strip(x) |> x->parse(Int64,x)
    outfl = open("large_storecredit.out","w")
    i=0
    while (num_testcase>=1)
        i+=1
        c  = readline(fl) |> x->strip(x) |> x->parse(Int64,x)
        l  = readline(fl) |> x->strip(x) |> x->parse(Int64,x)
        ps = readline(fl) |> x->strip(x) |> x->split(x, " ") |> x->map(y->parse(Int64,y),x)
        findinds(outfl,c,l,ps,i)
        num_testcase -= 1
    end
    close(outfl)
    close(fl)
end

function findinds(outfl,c,l,ps,idcase)
    @assert length(ps) == l
    indperm = sortperm(ps)
    ps = ps[indperm]
    ind1,ind2=0,0
    for i in 1:l-1
        for j in i+1:l
            s = ps[i]+ps[j]
            if s == c
                ind1,ind2 = sort([indperm[i],indperm[j]])
            end
        end
    end
    println(outfl, "Case #$(idcase): $ind1 $ind2")
end




end
