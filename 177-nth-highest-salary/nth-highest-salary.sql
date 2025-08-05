create function getnthhighestsalary(N int) returns int
begin
    set N = N-1;
    return(
        select distinct salary from employee
        order by salary desc
        limit 1 offset N
    );
end 
 