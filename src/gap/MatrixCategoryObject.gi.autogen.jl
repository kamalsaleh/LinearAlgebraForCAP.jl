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
InstallMethod( VectorSpaceObject,
               [ IsInt, IsFieldForHomalg ],
                
  function( dimension, homalg_field )
    
    return MatrixCategoryObject( MatrixCategory( homalg_field ), dimension );
    
end );

##
InstallMethodForCompilerForCAP( MatrixCategoryObjectOp,
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
InstallMethod( UnderlyingFieldForHomalg,
               [ IsVectorSpaceObject ],
               
  function( object )
    
    return UnderlyingRing( CapCategory( object ) );
    
end );

####################################
##
## View
##
####################################

InstallMethod( String,
              [ IsVectorSpaceObject ],
              
  function( vector_space_object )
    
    return Concatenation( "A vector space object over ",
                          RingName( UnderlyingRing( CapCategory( vector_space_object ) ) ),
                          " of dimension ", string( Dimension( vector_space_object ) ) );
    
end );
##
InstallMethod( ViewObj,
               [ IsVectorSpaceObject ],

  function( vector_space_object )

    Print( Concatenation( "<", string( vector_space_object ), ">" ) );

end );

##
InstallMethod( Display,
               [ IsVectorSpaceObject ],
               
  function( vector_space_object )
    
    Print( string( vector_space_object ), "\n" );
    
end );

#=
##
InstallMethod( LaTeXOutput,
               [ IsVectorSpaceObject ],
               
  function( vector_space_object )
    
    return Concatenation( LaTeXOutput( UnderlyingRing( CapCategory( vector_space_object ) ) ), "^[1 \\times ", string( Dimension( vector_space_object ) ), "]" );
    
end );
# =#
