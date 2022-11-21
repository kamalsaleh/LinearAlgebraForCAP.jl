# SPDX-License-Identifier: GPL-2.0-or-later
# LinearAlgebraForCAP: Category of Matrices over a Field for CAP
#
# Reading the implementation part of the package.
#
include( "gap/precompiled_categories/MatrixCategoryPrecompiled.gi.autogen.jl" );

include( "gap/LinearAlgebraForCAP.gi.autogen.jl" );

include( "gap/MatrixCategoryObject.gi.autogen.jl" );

include( "gap/MatrixCategoryMorphism.gi.autogen.jl" );

#=
if IsPackageMarkedForLoading( "FreydCategoriesForCAP", ">= 2022.10-14" ) then
    
    include( "gap/MatrixCategoryAsCategoryOfRows.gi.autogen.jl" );
    
fi;
# =#
