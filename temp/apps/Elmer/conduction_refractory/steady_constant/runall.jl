# -*- coding: utf-8 -*-

"Helper function to redirect outputs to the right files."
function redirect_to_files(dofunc, outfile, errfile)
    open(outfile, "w") do out
        open(errfile, "w") do err
            redirect_stdout(out) do
                redirect_stderr(err) do
                    dofunc()
                end
            end
        end
    end
end

"Remove everything generated automatically during previous run."
function cleanup()
    # rm("geometry/"; force = true, recursive = true)
    rm("logs/";     force = true, recursive = true)
    rm("results/";  force = true, recursive = true)
end

"Run the full simulation workflow from pre- to postprocessing."
function workflow()
    geo = joinpath(@__DIR__, "../geometry.geo")
    unv = joinpath(@__DIR__, "../geometry.unv")



    @info "Generating base computational mesh..."
    redirect_to_files("log.exe.gmsh", "log.err.gmsh") do
        run(`gmsh - $(geo) -order 2`)
    end

    @info "Handling conversion to Elmer grid format..."
    redirect_to_files("log.exe.grid", "log.err.grid") do
        run(`ElmerGrid 8 2 $(unv) -autoclean -merge 1.0e-05`)
        rm(unv; force = true)
    end

    @info "Solving/integrating problem (may take a while)..."
    redirect_to_files("log.exe.solver", "log.err.solver") do
        open("ELMERSOLVER_STARTINFO", "w") do fp
            write(fp, "case.sif\n1\n")
        end
        run(`ElmerSolver`)
        rm("refractory.dll"; force = true)
        rm("ELMERSOLVER_STARTINFO"; force = true)
    end

    @info "Cleaning up logs..."
    !isdir("logs") && mkdir("logs")
    moov(f) = mv(f, "logs/$f"; force = true)
    map(moov, filter(startswith("log."), readdir()))

    @info "DONE!"
    return nothing
end

workflow()
