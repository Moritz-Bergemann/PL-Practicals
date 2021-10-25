with Ada.Text_IO;
use Ada.Text_IO;
procedure BubbleSort is
    -- Types
    type Array_Size is range 0 .. 9;
    type Array_Values is range 0 .. 1000;
    type Array_Type is array (Array_Size) of Array_Values;

    -- Variables
    Sorted: Boolean := False;
    New_Number: Integer := 123;
    Temp: Array_Values;
    My_Array: Array_Type := (124, 12, 12, 5, 15, 6, 1, 2, 3, 1);
begin
    -- Print the initial array
    Put_Line ("INITAL ARRAY:");
    for ii in Array_Size loop
        Put_Line (Array_Values'Image(My_Array(ii)));
    end loop;

    -- Do the sort
    while not Sorted loop
        Sorted := True;
        for jj in Array_Size'First .. Array_Size'Last - 1 loop
            -- If the elements are unequal
            if My_Array(jj) > My_Array(jj + 1) then
                -- Since we had to swap something, the array wasn't sorted
                Sorted := False;
                
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