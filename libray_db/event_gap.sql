
select event1,event2,max(gapdays) as Longestgap
(select e1.eventName as event1,e2.eventName as event2,
julianday(e2.eventName) - julianday(e1.eventName) as gapdays
from events e1
JOIN events e2
on e1.eventDate < e2.eventDate)