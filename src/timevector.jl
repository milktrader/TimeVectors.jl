import Base: getindex, show, convert, sum, prod, mean, var, std, maximum, minimum, merge

abstract AbstractTimeSeries
 
immutable TimeVector{T<:Float64,D<:TimeType} <: AbstractTimeSeries
    timestamp::PersistentVector{D}
    values::PersistentVector{T}
end

function timevector{T<:Float64, D<:TimeType}(tstamp::Vector{D}, vals::Vector{T})
    TimeVector(pvec(tstamp), pvec(vals))
end

function timevector{T<:Float64, D<:TimeType}(tstamp::Vector{D}, vals::Matrix{T})
    TimeVector(pvec(tstamp), pvec(vals))
end

function timevector{T<:Float64,N,D<:TimeType}(ta::TimeArray{T,N,D})
    TimeVector(pvec(ta.timestamp), pvec(ta.values))
end

function Base.show(io::IO, tv::TimeVector)

    nrow = size(tv.values, 1)

  # timestamp and values line
    if nrow > 7
        for i in 1:4
            print(io, tv.timestamp[i], " | ", tv.values[i])
            println(io, "")
        end

        println(io, '\u22EE')

        for i in nrow-3:nrow
            print(io, tv.timestamp[i], " | ", tv.values[i])
            println(io, "")
        end

    elseif nrow > 0

        for i in 1:nrow
            print(io, tv.timestamp[i], " | ", tv.values[i])
            println(io, "")
        end
    end
end
