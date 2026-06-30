CALL GetPurchasedTicketsByUser(8);

CALL GetCancelledReservations(@total_cancelled_count);
SELECT @total_cancelled_count AS 'Total Cancelled';

CALL SearchUsersCriteria('Mohammad', 'rezaei.m@email.com');
CALL SearchUsersCriteria('Sara', NULL);

CALL GetUsersByCity('Tehran');

CALL GetTicketsByCity('Tehran');

CALL IdentifyTopBuyers(@top_buyers);
SELECT @top_buyers AS 'Top Buyers Summary';

CALL GetCancelledTicketsBySport('Football');

CALL GetTopReporters();