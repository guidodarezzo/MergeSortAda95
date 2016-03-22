

with Text_IO;
with Sort;

procedure ProgMain is
   use Text_IO;
   use Sort;
   package int_io is new Integer_IO(Integer);
   use int_io;

   MyArray: yourNumbers;
   ArrayTotal: Integer := 0;

   --declare array to be operated on


   task Reader is
      entry GetNow;
   end Reader;

   task Sum is
      entry SumNow;
   end Sum;

   task Printer is
      entry PrintNow;
   end Printer;

   task body Reader is
   begin
      accept GetNow do
      for ArrayIndex in 1..SIZE loop
         get(MyArray(ArrayIndex));
         end loop;
      end GetNow;
   end Reader;

   task body Printer is
   begin

      accept PrintNow do
         Sum.SumNow;
         for ArrayIndex in 1..SIZE loop
            New_Line;
            put(MyArray(ArrayIndex));
         end loop;
--           Sum.SumNow;
      end PrintNow;

   end Printer;

   task body Sum is

   begin
      accept SumNow  do

      for ArrayIndex in 1..SIZE loop
            ArrayTotal := ArrayTotal + MyArray(ArrayIndex);
            put(ArrayTotal); --delete this after demo
         end loop;

         New_Line;
         put("This is the Sum: ");
         put(ArrayTotal);

         end SumNow;


   end Sum;


begin

   Reader.GetNow;
   MergeSort(MyArray,1,SIZE);
   Printer.PrintNow;

end ProgMain;


