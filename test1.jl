# test1.jl
# Julia Script

#=
Description:
Author: AbbeFaria
Date: 4/9/26
=#
using LinearAlgebra


c = 1.0
n = 2
true_radars = [
    (3.0, 4.0)
    (7.0, 2.0)
]
function signal(x, y, u, v, c)
    return c / ((x-u)^2 + (y-v)^2)
end

function total_signal(x, y, radars, c)
    s = 0.0
    for (u, v) in radars
        s =+ signal(x, y, u, v, c)
    end
    return s
end

measurement_points = [
    (0.0, 0.0),
    (5.0, 0.0),
    (10.0, 0.0),
    (0.0, 5.0),
    (10.0, 5.0),
    (5.0, 6.0),
    (2.0, 1.0),
    (8.0, 5.0)
]
m = length(measurement_points)

noise_level = 0.1
measurements = Float64[]

for (xi, yi) in measurement_points
    zi = total_signal(xi, yi, true_radars, c) + noise_level*rand()
    push!(measurements, zi)
end

for i in 1:m
    println(measurements[i])
end
