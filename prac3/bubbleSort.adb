with Ada.Text_IO;
use Ada.Text_IO;
procedure BubbleSort is
    -- Types
    type Array_Size is range 0 .. 4;
    type Array_Values is range 0 .. 1000;
    type Array_Type is array (Array_Size) of Array_Values;

    -- Types
    New_Number: Integer := 123;
    Temp: Array_Values;
    My_Array: Array_Type := (50, 40, 30, 20, 10);
begin
    -- Print the initial array
    Put_Line ("INITAL ARRAY:");
    for ii in Array_Size loop
        Put_Line (Array_Values'Image(My_Array(ii)));
    end loop;

    -- Do the sort
    for ii in reverse Array_Size loop --TODO make this like actual bubble sort with a "sorted" flag
        for jj in Array_Size'First .. ii - 1 loop
            -- If the elements are unequal
            if My_Array(jj) > My_Array(jj + 1) then
                -- Swap the elements
                Temp := My_Array(jj + 1);
                My_Array(jj + 1) := My_Array(jj); 
                My_Array(jj) := Temp; 
            end if;
        end loop;
    end loop;

    -- Print the final array
    Put_Line ("FINAL ARRAY:");
    for ii in Array_Size loop
        Put_Line (Array_Values'Image(My_Array(ii)));
    end loop;
end BubbleSort;