function [Ref_Macro_Block] = RefBlock(r,c,difference_i,difference_j,macro_block_Size,Ref_Frame)
%input arguments
%r: row index for the macroblock
%c: column index for the macroblock
%i_diff: recieved motion vector 'row'
%j_diff: recieved motion vector 'column'
%macro_block_Size: size of the macro block
%Ref_Frame: the reference frame

%current frame position
current_i_start = 8*r - 7; 
current_j_start = 8*c - 7;
%reference frame position
Ref_iStart = current_i_start + difference_i;
Ref_jStart = current_j_start + difference_j;

macro_block_Size = macro_block_Size+1;
macro_block_Size = macro_block_Size-1;

Ref_Macro_Block = zeros(macro_block_Size);

a = 1;
%getting the reference matched macroblock
for r = Ref_iStart: (Ref_iStart+macro_block_Size-1)
    b=1;
    for c = Ref_jStart: (Ref_jStart+macro_block_Size-1)
        Ref_Macro_Block(a,b) = Ref_Frame(r,c);
        b = b+1;
    end
    a = a+1;
        
end

