-- Xom Data · Parcels bound for Da Nang
-- Problem: https://xomdata.com/practice/easy-join-002
-- Solved: 2026-08-14

-- Viết SQL của bạn ở đây
select tracking_code, recipient_name
FROM recipients
join parcels on recipients.id = parcels.recipient_id
where city = 'Da Nang';
