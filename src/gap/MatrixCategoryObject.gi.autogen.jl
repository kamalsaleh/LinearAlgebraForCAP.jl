# SPDX-License-Identifier: GPL-2.0-or-later
# LinearAlgebraForCAP: Category of Matrices over a Field for CAP
#
# Implementations
#

####################################
##
## Constructors
##
####################################

##
InstallMethod( @__MODULE__,  VectorSpaceObject,
               [ IsInt, IsFieldForHomalg ],
                
  function( dimension, homalg_field )
    
    return MatrixCategoryObject( MatrixCategory( homalg_field ), dimension );
    
end );

##
InstallMethod( @__MODULE__,  MatrixCategoryObjectOp,
                                [ IsMatrixCategory, IsInt ],
                                
  function( cat, dimension )
    local category;
    
    if !IsInt( dimension ) || dimension < 0
        
        Error( "the object datum must be a non-negative integer" );
        
    end;
    
    return CreateCapCategoryObjectWithAttributes( cat, Dimension, dimension );
    
end );

##
# backwards compatibility
InstallOtherMethod( MatrixCategoryObject,
                    [ IsFieldForHomalg, IsInt ],
                    
  function( homalg_field, dimension )
    
    return MatrixCategoryObject( MatrixCategory( homalg_field ), dimension );
    
end );

####################################
##
## Attributes
##
####################################

##
InstallMethod( @__MODULE__,  UnderlyingFieldForHomalg,
               [ IsVectorSpaceObject ],
               
  function( object )
    
    return UnderlyingRing( CapCategory( object ) );
    
end );

####################################
##
## View
##
####################################

InstallMethod( @__MODULE__,  String,
              [ IsVectorSpaceObject ],
              
  function( vector_space_object )
    
    return Concatenation( "A vector space object over ",
                          RingName( UnderlyingRing( CapCategory( vector_space_object ) ) ),
                          " of dimension ", string( Dimension( vector_space_object ) ) );
    
end );
##
InstallMethod( @__MODULE__,  ViewObj,
               [ IsVectorSpaceObject ],

  function( vector_space_object )

    Print( Concatenation( "<", string( vector_space_object ), ">" ) );

end );

##
InstallMethod( @__MODULE__,  Display,
               [ IsVectorSpaceObject ],
               
  function( vector_space_object )
    
    Print( string( vector_space_object ), "\n" );
    
end );

#=
##
InstallMethod( @__MODULE__,  LaTeXOutput,
               [ IsVectorSpaceObject ],
               
  function( vector_space_object )
    
    return Concatenation( LaTeXOutput( UnderlyingRing( CapCategory( vector_space_object ) ) ), "^[1 \\times ", string( Dimension( vector_space_object ) ), "]" );
    
end );
# =#
