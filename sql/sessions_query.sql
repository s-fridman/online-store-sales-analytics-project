WITH session_params AS (
  SELECT ga_session_id, continent, country, device, browser,
  mobile_model_name, operating_system, COALESCE(language, 'Unknown') as browser_language,
  medium as traffic_source, channel as traffic_channel
  FROM `DA.session_params`
),
orders AS (
  SELECT o.ga_session_id, p.category as product_category, p.name as product_name,
  p.price as product_price, p.short_description as product_description
  FROM `DA.order` o
  LEFT JOIN `DA.product` p
  ON o.item_id = p.item_id
),
accounts AS (
  SELECT acs.ga_session_id, a.id as account_id,
  a.is_verified, a.is_unsubscribed
  FROM `DA.account_session` acs
  LEFT JOIN `DA.account` a
  ON acs.account_id = a.id
)

SELECT s.date as session_date, s.ga_session_id as session_id,
sp.continent, sp.country, sp.device, sp.browser, sp.mobile_model_name,
sp.operating_system, sp.browser_language, sp.traffic_source, sp.traffic_channel,
a.account_id,
CASE WHEN a.account_id IS NULL THEN 'Guest'
     WHEN a.is_verified = 1 THEN 'Verified'
     ELSE 'Not verified' END as account_status,
CASE WHEN a.account_id IS NULL THEN 'Guest'
     WHEN a.is_unsubscribed = 1 THEN 'Unsubscribed'
     ELSE 'Subscribed' END as subscription_status,
o.product_category, o.product_name, o.product_price, o.product_description
FROM `DA.session` s
LEFT JOIN session_params sp
ON s.ga_session_id = sp.ga_session_id
LEFT JOIN orders o
ON s.ga_session_id = o.ga_session_id
LEFT JOIN accounts a
ON s.ga_session_id = a.ga_session_id
