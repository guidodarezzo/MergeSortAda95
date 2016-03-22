

package Sort is
   SIZE: constant Integer := 40;
   TYPE yourNumbers is array (1..SIZE) of Integer range -500..500;
   procedure MergeSort (InitialArray: in out yourNumbers; PointLeft: in Integer; PointRight: in Integer);
   procedure MergeMe (InitialArray: in out yourNumbers; PointLeft, MidPoint, PointRight: in Integer);

end Sort;
