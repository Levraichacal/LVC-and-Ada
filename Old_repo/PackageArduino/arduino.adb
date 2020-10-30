

package body ARDUINO is

-- La fonction min.
function min(A,B:Nat16) return Nat16
is
begin
if(A>B) then 
return B;
else
return A;
end if;
end min;

-- La fonction max.
function max(A,B:Nat16) return Nat16
is
begin
if(A>B) then 
return A;
else
return B;
end if;
end max;

-- La fonction abs.
function abs (A:Nat16) return Nat16
is
begin
if(A>0) then 
return A;
else
return -A;
end if;
end abs;


-- La fonction constrain.
function constrain(A,B,C:Nat16) return Nat16
is
begin
if(A<B) then
return B;
else
if(A>C) then
return C;
else
return A;
end if;
end if;
end constrain;


-- La fonction radians.
function radians(deg: Nat16) return Nat16
is
begin
return DEG_TO_RAD*deg;
end radians;

-- La fonction degrees.
function degrees(rad: Nat16) return Nat16
is 
begin
return RAD_TO_DEG*rad:
end degrees;

-- La fonction sq.
function sq(A: Nat16) return Nat16
is
begin
return A*A;
end sq;


end ARDUINO;
