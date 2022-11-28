__precompile__(false)

module LinearAlgebraForCAP

import Base.string
import Base.show

import CapAndHomalg
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

const IsFieldForHomalg = Filter("IsFieldForHomalg", GAP_jll.GapObj)
const IsHomalgRing = Filter("IsHomalgRing", GAP_jll.GapObj)
const IsHomalgMatrix = Filter("IsHomalgMatrix", GAP_jll.GapObj)

import CAP.Display

include("init.jl")

end # module LinearAlgebraForCAP
