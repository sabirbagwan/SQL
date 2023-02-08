WITH
cte
AS
(
SELECT ctid,
       row_number() OVER (PARTITION BY "Date",
                                       "Expiry", 
						  				"Strike", 
						  				"Time", 
						  				"Open",
						  				"High",
						  				"Low",
						  				"Close"
                          ORDER BY "Date") rn
       FROM bnce
)
DELETE FROM bnce
       USING cte
       WHERE cte.rn > 1
             AND cte.ctid = bnce.ctid;
