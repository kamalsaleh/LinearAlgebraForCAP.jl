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
InstallMethod( @__MODULE__,  AsVectorSpaceMorphism,
               [ IsHomalgMatrix ],
               
  function( homalg_matrix )
    local field;
    
    field = HomalgRing( homalg_matrix );
    
    return VectorSpaceMorphism(
      VectorSpaceObject( NrRows( homalg_matrix ), field ),
      homalg_matrix,
      VectorSpaceObject( NrColumns( homalg_matrix ), field )
    );
    
end );

##
# convenience
InstallMethod( @__MODULE__,  VectorSpaceMorphism,
               [ IsVectorSpaceObject, IsList, IsVectorSpaceObject ],
               
  function( source, element_list, range )
    local field, homalg_matrix;
    
    field = UnderlyingRing( CapCategory( source ) );
    
    homalg_matrix = HomalgMatrix( element_list, Dimension( source ), Dimension( range ), field );
    
    return VectorSpaceMorphism( source, homalg_matrix, range );
    
end );

##
# convenience
InstallMethod( @__MODULE__,  VectorSpaceMorphism,
               [ IsVectorSpaceObject, IsHomalgMatrix, IsVectorSpaceObject ],
               
  function( source, homalg_matrix, range )
    
    return VectorSpaceMorphism( CapCategory( source ), source, homalg_matrix, range );
    
end );

##
InstallOtherMethodForCompilerForCAP( VectorSpaceMorphism,
                                     [ IsMatrixCategory, IsVectorSpaceObject, IsHomalgMatrix, IsVectorSpaceObject ],
                                     
  function( cat, source, homalg_matrix, range )
    
    if !IsHomalgMatrix( homalg_matrix )
        
        Error( "the morphism datum must be a homalg matrix" );
        
    end;
    
    if !IsIdenticalObj( HomalgRing( homalg_matrix ), UnderlyingRing( cat ) )
        
        Error( "the matrix is defined over a different ring than the category" );
        
    end;
    
    if NrRows( homalg_matrix ) != Dimension( source )
        
        Error( "the number of rows has to be equal to the dimension of the source" );
        
    end;
    
    if NrColumns( homalg_matrix ) != Dimension( range )
        
        Error( "the number of columns has to be equal to the dimension of the range" );
        
    end;
    
    return CreateCapCategoryMorphismWithAttributes( cat, source, range,
                                                    UnderlyingMatrix, homalg_matrix
    );
    
end );

####################################
##
## Attributes
##
####################################

##
InstallMethod( @__MODULE__,  UnderlyingFieldForHomalg,
               [ IsVectorSpaceMorphism ],
               
  function( morphism )
    
    return UnderlyingRing( CapCategory( morphism ) );
    
end );

####################################
##
## View
##
####################################

##
InstallMethod( @__MODULE__,  Display,
               [ IsVectorSpaceMorphism ],
               
  function( vector_space_morphism )
    
    Display( UnderlyingMatrix( vector_space_morphism ) );
    
    Print( "\n" );
    
    Print( StringMutable( vector_space_morphism ) );
    
    Print( "\n" );
    
end );

#=
##
InstallMethod( @__MODULE__,  LaTeXOutput,
          [ IsVectorSpaceMorphism ],
          
  function( vector_space_morphism )
    local matrix;
    
    matrix = LaTeXOutput( UnderlyingMatrix( vector_space_morphism ) );
    
    if ValueOption( "OnlyDatum" ) == true
       
       return Concatenation(
        """[\color[blue][""",
        matrix,
        """]]"""
      );
      
    else
      
      return Concatenation(
        LaTeXOutput( Source( vector_space_morphism ) ),
        """[\color[blue][\xrightarrow[""",
        matrix,
        """]]]""",
        LaTeXOutput( Range( vector_space_morphism ) )
      );
      
    end;
    
end );
# =#

####################################
##
## Convenience
##
####################################

##
InstallOtherMethod( /,
               [ IsHomalgMatrix, IsMatrixCategory ],
  function( homalg_matrix, category )
    local field;
    
    field = HomalgRing( homalg_matrix );
    
    return VectorSpaceMorphism(
      MatrixCategoryObject( category, NrRows( homalg_matrix ) ),
      homalg_matrix,
      MatrixCategoryObject( category, NrColumns( homalg_matrix ) )
    );
    
end );
