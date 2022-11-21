__precompile__(false)

module LinearAlgebraForCAP

import CapAndHomalg
import CapAndHomalg.IsFieldForHomalg
import CapAndHomalg.IsHomalgRing
import CapAndHomalg.IsHomalgMatrix
import CapAndHomalg.RingName
import CapAndHomalg.HomalgIdentityMatrix
import CapAndHomalg.HomalgZeroMatrix
import CapAndHomalg.SyzygiesOfRows
import CapAndHomalg.SyzygiesOfColumns
import CapAndHomalg.CertainRows
import CapAndHomalg.CertainColumns
import CapAndHomalg.ConvertMatrixToRow
import CapAndHomalg.ConvertRowToMatrix
import CapAndHomalg.DecideZeroRows
import CapAndHomalg.DecideZeroColumns
import CapAndHomalg.LeftDivide
import CapAndHomalg.RightDivide



import GAP_jll
using CAP
filters_to_types[IsFieldForHomalg] = GAP_jll.GapObj
filters_to_types[IsHomalgRing] = GAP_jll.GapObj
filters_to_types[IsHomalgMatrix] = GAP_jll.GapObj

include("init.jl")
greet() = print("Hello World!")

end # module LinearAlgebraForCAP
