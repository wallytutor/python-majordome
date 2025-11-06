module Elmer

using DataFrames
using DelimitedFiles
using CairoMakie

import ..Common

#######################################################################
# API
#######################################################################

export get_convergence_history
export plot_nonlinear_convergence
export load_saveline_table

function get_convergence_history(project; fname = "convergence.dat")
    fname = joinpath(project, fname)
    data = readdlm(fname; skipstart=1)
    header = get_convergence_header(fname)
    df = DataFrame(data, header)

	Common.set_type!(df, "solver", Int64)
	Common.set_type!(df, "ss/ns", Int64)
	Common.set_type!(df, "timestep", Int64)
	Common.set_type!(df, "coupled", Int64)
	Common.set_type!(df, "nonlin", Int64)

    return df
end

function plot_nonlinear_convergence(table, solver_no;
        convergence = 1.0e-6,
        xlimits = nothing,
        ylimits = (1e-8, 1e-2),
        full_plot = true
    )
    df = select_solver(table, solver_no)
    last_iter = find_last_iter!(df)

    with_theme(Common.MAKIETHEME) do
        f = Figure()
        ax = Axis(f[1, 1]; yscale = log10)

        if !isnothing(convergence)
            hlines!(ax, convergence; color = :blue, linestyle = :dash)
        end

        if full_plot
            x, y = df[!, "pseudotime"], df[!, "change"]
            lines!(ax, x, y; color = :black)

            x, y = last_iter[!, "pseudotime"], last_iter[!, "change"]
            scatter!(ax, x, y; color = :red)
        else
            x, y = last_iter[!, "pseudotime"], last_iter[!, "change"]
            lines!(ax, x, y; color = :black)
        end

        if !isnothing(xlimits)
            xlims!(ax, xlimits)
        end

        if !isnothing(ylimits)
            ylims!(ax, ylimits)
        end

        ax.xlabel = "Time step"
        ax.ylabel = "Change"
		ax.yminorticksvisible = true
		ax.yminorgridvisible = true
        ax.yminorticks = IntervalsBetween(9)

        f, ax
    end
end

function load_saveline_table(results; fname = "sides.dat")
    head = get_saveline_columns(joinpath(results, "$(fname).names"))
    data = readdlm(joinpath(results, fname))
    return DataFrame(data, head)
end

#######################################################################
# INTERNALS
#######################################################################

function get_convergence_header(fname)
    open(fname) do fp
        line = readline(fp)

        if !startswith(line, "!")
            error("""\
                Not a convergence file; it is expected to start by a \
                `!` indicating a comment: got $(line[1])
                """)
        end

        line = Common.uncomment(line)
        line = split(line, " ")
        line = Common.remove_spaces(line)
        return line
    end
end

function select_solver(df, solver_no; dropcol = true)
	rows = subset(df, "solver" => ByRow(x -> x == solver_no))
	dropcol && return select(rows, Not("solver"))
	return rows
end

function find_last_iter!(df)
	grouped_df = groupby(df, "timestep")
	max_values = combine(grouped_df, "nonlin" => maximum => "idx")

	last_iter = innerjoin(df, max_values, on = ["timestep", "nonlin" => "idx"])
	create_pseudotime!(df, last_iter)

    # Repeat to get with `pseudotime` column.
	last_iter = innerjoin(df, max_values, on = ["timestep", "nonlin" => "idx"])
	return last_iter
end

function create_pseudotime!(df, last_iter)
	time_dict = Dict(zip(last_iter[!, "timestep"], last_iter[!, "nonlin"]))

	func(timestep, nonlin) = timestep + (nonlin - 2) / time_dict[timestep]

	transform!(df, ["timestep", "nonlin"] => ByRow(func) => "pseudotime")
	return nothing
end

function get_saveline_columns(filename; verbose = false, newline = nothing)
    metadata = read(filename, String)
    verbose && @info(metadata)

    if isnothing(newline)
        newline = Sys.iswindows() ? "\r\n" : "\n"
    end

    lines = split(metadata, newline)
    lines = filter(l->occursin(r"^(\s+)(\d+):.", l), lines)
    return map(l->match(r"^\s+\d+:\s+(?<x>(.+))", l)["x"], lines)
end

end # (Elmer)

module Fluent

using DataFrames
using DelimitedFiles: readdlm
using Statistics: mean

import ..Common

#######################################################################
# API
#######################################################################

function read_report(filename; n_last::Int = -1, header_number::Int = 3)
    header = get_report_header(filename, header_number)
    data = get_report_data(filename, header_number, n_last)
    return DataFrame(data, header)
end

#######################################################################
# INTERNALS
#######################################################################

function get_report_header(filename::String, header_number::Int)
    line = Common.read_specific_row(filename, header_number)
    matches = eachmatch(r"\"([^\"]*)\"", line)
    return String.(map(m->first(m.captures), matches))
end

function get_report_data(filename::String, header_number::Int, n_last::Int)
    n_last <= 0 && return readdlm(filename; skipstart=header_number)

    n_lines = Common.count_lines(filename)
    n = min(n_lines-header_number, n_last)
    return Common.get_last_lines(filename, n)
end

end

module Common

using DataFrames
using DelimitedFiles
using CairoMakie

function remove_spaces(list)
    return filter(x -> x != "", list)
end

function uncomment(line; comment_char = "!")
    !startswith(line, comment_char) && return line
    return line[length(comment_char)+1:end]
end

function set_type!(df, column, totype)
	!(column in names(df)) && return
	transform!(df, column => ByRow(x -> convert(totype, x)) => column)
	return nothing
end

function read_specific_row(filename::String, row_number::Int)
    line = open(filename) do file
        current_row = 1

        for line in eachline(file)
            current_row == row_number && return line
            current_row += 1
        end
    end

    isnothing(line) && error("Row number out of range")
    return line
end

function count_lines(filename::String)
    return open(filename) do fp
        sum(_->1, eachline(fp))
    end
end

function get_last_lines(filename::String, n::Int)
    last_n_lines = open(filename) do file
        all_lines = readlines(file)
        return all_lines[end-n+1:end]
    end

    combined_lines = join(last_n_lines, "\n")
    data = readdlm(IOBuffer(combined_lines))

    return data
end

end # (Common)