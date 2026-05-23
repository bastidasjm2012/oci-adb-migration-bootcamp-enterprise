SELECT /*+
 USE_NL(s c p)
 LEADING(s c p)
 FULL(s)
 FULL(c)
 FULL(p)
 NO_PARALLEL
 NO_MERGE
 NO_UNNEST
 NO_SWAP_JOIN_INPUTS
*/
 s.prod_id,
 s.cust_id,
 s.amount_sold,
 c.cust_first_name,
 p.prod_name
FROM
 sales s,
 customers c,
 products p
WHERE
 s.cust_id = c.cust_id
 AND s.prod_id = p.prod_id
 AND c.cust_last_name LIKE '%A%'
 AND p.prod_name LIKE '%A%';
