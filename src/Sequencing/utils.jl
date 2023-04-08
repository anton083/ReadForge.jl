
export
    reverse_range

reverse_range(range::UnitRange{Int}, length::Int) = (length-last(range)+1):(length-first(range)+1)