
with Text_IO;

package body Sort is
   use Text_IO;
   package int_io is new Integer_IO(Integer);
   use int_io;
procedure MergeSort (InitialArray: in out yourNumbers; PointLeft: in Integer;
                     PointRight: in Integer) is

      PointMid: Integer;

      procedure DivideThis is

      begin

      declare

         task DivideLeft;

         task DivideRight;

            task body DivideLeft is
            begin

               MergeSort(InitialArray, PointLeft, PointMid);

            end DivideLeft;

            task body DivideRight is
            begin

               MergeSort(InitialArray, PointMid + 1, PointRight);

            end DivideRight;

         begin
            null;
         end;--end declare statement

         end DivideThis;


begin

   if (PointLeft < PointRight) then

      PointMid := (PointLeft + PointRight)/2;
      DivideThis;
      MergeMe(InitialArray, PointLeft, PointMid, PointRight);

      end if;

   end MergeSort;



   procedure MergeMe (InitialArray: in out yourNumbers; PointLeft, MidPoint, PointRight: in Integer) is

      TempArray: yourNumbers;

      PosLeft: Integer := PointLeft;
      PosRight: Integer := MidPoint + 1;
      --These keep incrementing as the while loop compares each position in the array from left to right.

      KeepAtFront: Integer := PointLeft;
      --Keeps track of the beginning of the index.

   begin


      --I want to copy the array into a temporary one in order to compare the
      --elements of left and right.
      for i in PointLeft..PointRight loop

         TempArray(i) := InitialArray (i);

      end loop;


      --This while loop now compares each value at given indices from left to right. Initial Sort.

      while PosLeft <= MidPoint and PosRight <= PointRight loop

         if TempArray (PosLeft) <= TempArray (PosRight) then
            InitialArray(KeepAtFront) := TempArray(PosLeft);
            PosLeft := PosLeft + 1;

         else
            InitialArray(KeepAtFront) := TempArray(PosRight);
            PosRight := PosRight + 1;
         end if;

         KeepAtFront := KeepAtFront + 1;

      end loop;

      --These next loops are in place to make sure each element from both left
      --and right sides are properly copied over to the InitialArray.
      for i in PosLeft..MidPoint loop
         InitialArray(KeepAtFront) := TempArray(PosLeft);
         KeepAtFront := KeepAtFront + 1;
         PosLeft := PosLeft + 1;
      end loop;

      for i in PosRight..PointRight loop
         InitialArray(KeepAtFront) := TempArray(PosRight);
         KeepAtFront := KeepAtFront + 1;
         PosRight := PosRight + 1;
      end loop;


   end MergeMe;


end Sort;



































