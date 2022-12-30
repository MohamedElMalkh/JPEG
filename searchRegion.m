function [i_start,j_start ,i_final,j_final] = searchRegion(current_i_start,current_j_start,MacroBlock_size,Ref_frame_size)
%current_i_start,current_j_start represent the initial pixel position for
%the macro block in the current frame
current_i_end = current_i_start + MacroBlock_size-1;
current_j_end = current_j_start + MacroBlock_size-1;

%i_start
if current_i_start == 1
    i_start = current_i_start;
else
    i_start = floor(current_i_start - 0.5 * MacroBlock_size);
end
if i_start < 1
    i_start = 1;
end

%j_start
if current_j_start == 1
    j_start = current_j_start;
else
    j_start = floor(current_j_start - 0.5 * MacroBlock_size);
end
if j_start < 1
    j_start = 1;
end

%i_final
if current_i_end == Ref_frame_size(1)
    i_final = current_i_start;
else
    i_final = current_i_start + 0.5 * MacroBlock_size;
end

if (i_final+MacroBlock_size-1) > (Ref_frame_size(1) - MacroBlock_size+1)
    i_final = Ref_frame_size(1) - MacroBlock_size;
end

%j_final
if current_j_end ==  Ref_frame_size(2)
    j_final = current_j_start;
else
    j_final = current_j_start + 0.5 * MacroBlock_size;
end

if (j_final+MacroBlock_size-1) > (Ref_frame_size(2) - MacroBlock_size+1)
    j_final = Ref_frame_size(2) - MacroBlock_size+1;
end

end