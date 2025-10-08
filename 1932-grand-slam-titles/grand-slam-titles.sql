# Write your MySQL query statement below
select p.player_id, p.player_name,
    sum( 
        case when player_id = Wimbledon then 1 else 0 end +
        case when player_id = Fr_open then 1 else 0 end +
        case when player_id = US_open then 1 else 0 end +
        case when player_id = Au_open then 1 else 0 end 

    ) as grand_slams_count
    from players p
    join championships c 
    on p.player_id in (Wimbledon , Fr_open, US_open , Au_open   )
    group by 1, 2