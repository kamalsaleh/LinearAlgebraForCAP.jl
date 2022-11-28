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
#! The GAP category of morphisms ⥉ the category
#! of matrices of a field  F .
#! @Arguments object
@DeclareFilter( "IsVectorSpaceMorphism",
                 IsCapCategoryMorphism );

####################################
##
#! @Section Constructors
##
####################################

#! @Description
#! The arguments are an object  S  ⥉ the category of matrices over a
#! homalg field  F , a homalg matrix  M  over  F , && another object  R 
#! ⥉ the category of matrices over  F .
#! The output is the morphism  S \rightarrow R  ⥉ the category
#! of matrices over  F  whose underlying matrix is given by  M .
#! @Returns a morphism ⥉  \mathrm[Hom](S,R) 
#! @Arguments S, M, R
@DeclareOperation( "VectorSpaceMorphism",
                  [ IsVectorSpaceObject, IsHomalgMatrix, IsVectorSpaceObject ] );

@DeclareOperation( "VectorSpaceMorphism",
                  [ IsVectorSpaceObject, IsList, IsVectorSpaceObject ] );

@DeclareAttribute( "AsVectorSpaceMorphism", IsHomalgMatrix );

@DeclareOperation( "/",
                  [ IsHomalgMatrix, IsMatrixCategory ] );

####################################
##
#! @Section Attributes
##
####################################

#! @Description
#! The argument is a morphism  \alpha  ⥉ the matrix category over a
#! homalg field  F .
#! The output is the field  F .
#! @Returns a homalg field
#! @Arguments alpha
@DeclareAttribute( "UnderlyingFieldForHomalg",
                  IsVectorSpaceMorphism );

#! @Description
#! The argument is a morphism  \alpha  ⥉ a matrix category.
#! The output is its underlying matrix  M .
#! @Returns a homalg matrix
#! @Arguments alpha
@DeclareAttribute( "UnderlyingMatrix",
                  IsVectorSpaceMorphism );
CapJitAddTypeSignature( "UnderlyingMatrix", [ IsVectorSpaceMorphism ], IsHomalgMatrix );
