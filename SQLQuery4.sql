select c.ID, c.Fee,c.ShippedOn,c.Weight,
co.Name as RecipientName, co.Address as RecipientAddress
, co1.Name as SenderName, co1.Address as SenderAddress


 from CONSIGNMENT c
left join CONTACT co
on
co.ID = c.Recipient

left join CONTACT co1
on
co1.ID = c.Sender