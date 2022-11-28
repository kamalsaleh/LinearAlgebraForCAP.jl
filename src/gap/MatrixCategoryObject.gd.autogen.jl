# SPDX-License-Identifier: GPL-2.0-or-later
# LinearAlgebraForCAP: Category of Matrices over a Field for CAP
#
# Declarations
#

#! @Chapter Category of Matrices

####################################
##
#! @Section GAP Categories
##
####################################

#! @Description
#! The GAP category of objects ⥉ the category
#! of matrices of a field  F .
#! @Arguments object
@DeclareFilter( "IsVectorSpaceObject",
                 IsCapCategoryObject );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#! The arguments are a non-negative integer  d 
#! && a homalg field  F .
#! The output is an object ⥉ the category of
#! matrices over  F  of dimension  d .
#! This function delegates to <C>MatrixCategoryObject</C>.
#! @Returns an object
#! @Arguments d, F
@DeclareOperation( "VectorSpaceObject",
                  [ IsInt, IsFieldForHomalg ] );

#! @Description
#! The arguments are a matrix category  cat  over a field
#! && a non-negative integer  d .
#! The output is an object ⥉  cat  of dimension  d .
#! @Returns an object
#! @Arguments cat, d
@KeyDependentOperation( "MatrixCategoryObject",
                       IsMatrixCategory, IsInt, ReturnTrue );


####################################
##
#! @Section Attributes
##
####################################

#! @Description
#! The argument is an object  A  ⥉ the matrix category over a
#! homalg field  F .
#! The output is the field  F .
#! @Returns a homalg field
#! @Arguments A
@DeclareAttribute( "UnderlyingFieldForHomalg",
                  IsVectorSpaceObject );

#! @Description
#! The argument is an object  A  ⥉ a matrix category.
#! The output is the dimension of  A .
#! @Returns a non-negative integer
#! @Arguments A
@DeclareAttribute( "Dimension",
                  IsVectorSpaceObject );
CapJitAddTypeSignature( "Dimension", [ IsVectorSpaceObject ], IsInt );
