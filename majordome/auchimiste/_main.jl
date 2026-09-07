module _main

import YAML

include("_plotting.jl")

export reaction

function reaction(name::String)
    println("Hello, $(name)!")
end

end # (module _main)
