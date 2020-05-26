for $item in doc("purchaseorders.xml")/PurchaseOrders/PurchaseOrder/item
let $partid := $item/partid
group by $partid 
order by $partid
return <totalcost partid="{$partid}"> {xs:double(doc("products.xml")/products/product[@pid=$item/partid]/description/price) * xs:int(sum($item/quantity))}</totalcost>