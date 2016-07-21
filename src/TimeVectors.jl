VERSION >= v"0.4.0-dev+6521" && __precompile__(true)

module TimeVectors

using Base.Dates, TimeSeries, FunctionalCollections

export TimeVector, 
       timevector

include("timevector.jl")

end
