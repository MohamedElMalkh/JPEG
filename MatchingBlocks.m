function [diff_i,diff_j ,diff_frame] = MatchingBlocks(current_block,Ref_Frame,search_Area,current_i_start,current_j_start)

%Input Arguments:

%current block: 8*8 macro block in the current frame
%Ref_Frame: The reference frame 
%search_Area: initial and final boundaries for the first cell of the
%current block to search for in the reference frame
%[i_initial,j_initial,i_final,j_final]

%--------------------------------------------------------------------------
%Arguments to be returned:

%Ref_Macro_Block: The best matched Macro_Block in the reference frame
%i_best: i index for the first cell of the Ref_Macro_Block
%j_best: j index for the first cell of the Ref_Macro_Block

%--------------------------------------------------------------------------
i_initial = search_Area(1);
j_initial = search_Area(2); 
i_final = search_Area(3);
j_final = search_Area(4);

%Number of blocks to be checked within the search area in the 
% reference frame
cases_size = (i_final - i_initial + 1) * (j_final - j_initial + 1);

%Index of the first cell for each macro_block taken in the reference frame
%Difference between the current_frame macro_block and the reference frame
%chosen macro_blocks
s.i = zeros(1,cases_size);
s.j = zeros(1,cases_size);
s.difference = zeros(1,cases_size);


Ref_Macro_Block = zeros(size(current_block));

index = 1;
i = i_initial;
j = j_initial;
while(i<=i_final)
    while(j<=j_final)
        a=1;
        for r = i: (i+length(current_block(:,1))-1)
            b=1;
            for c = j: (j+length(current_block(1,:))-1)
                Ref_Macro_Block(a,b) = Ref_Frame(r,c);
                b = b+1;
            end
            a = a+1;
        end
        s.i(index) = i;
        s.j(index) = j;
        s.difference(index) = sum(sum(abs(Ref_Macro_Block-current_block)));
        index = index + 1;
        j = j+1;
    end
    j = j_initial;
    i = i + 1;
end



[diff_min,ind] = min(s.difference);
i_best = s.i(ind);
j_best = s.j(ind);

a=1;
for r = i_best: (i_best+length(current_block(:,1))-1)
    b=1;
    for c = j_best: (j_best+length(current_block(1,:))-1)
        Ref_Macro_Block(a,b) = Ref_Frame(r,c);
        b = b+1;
    end
    a = a+1;
end

%arguments to be returned
%ref - current
diff_frame = Ref_Macro_Block - current_block;
diff_i = i_best - current_i_start;
diff_j = j_best - current_j_start;
end