create proc createuser(@username varchar,@Email varchar,@PasswordHash varchar,@Status varchar,
@AddressLine1 varchar,@AddressLine2 varchar,@City varchar,@State varchar,@PostalCode varchar,@CountryID int
)
as begin
insert into Users (userName,Email ,passwordHash ,Status ,
AddressLine1 ,AddressLine2 ,city ,state ,postalcode ,countryID 
)values(@username,@Email ,@PasswordHash ,@Status ,
@AddressLine1 ,@AddressLine2 ,@City ,@State ,@PostalCode ,@CountryID 
)
end
EXEC CreateUser
    @Username = 'Nourseen',
    @Email = 'nour@gmail.com',
    @PasswordHash = '145455',
    @Status = '1457',
    @AddressLine1 = 'alasr',
    @AddressLine2 = 'alkolya',
    @City = 'damiatte',
    @State = 'gh',
    @PostalCode = '1445',
    @CountryID = 1;

create proc updateuserstatus(@UserID int,@Status varchar)
as begin
update Users
set Status=@Status
where userId=@UserID
end
create proc createItem(@sellerID int,@CategoryID int ,@Title nvarchar(20),@Description nvarchar(100),
@startingPrice decimal(18,5),@currentprice decimal(18,5),@startDate date,@EndDate date ,@ImageUrl nvarchar(200))
as begin
insert into items (sellerID,CategoryID,Title,Description,startingPrice,currentprice,startDate,EndDate,ImageUrl)
values(@sellerID,@CategoryID,@Title,@Description,@startingPrice,@currentprice,@startDate,@EndDate,@ImageUrl)
end
create proc PlaceBid (@ItemID int,@UserId int,@BidAmount int)
as begin 
insert into Bids (itemid,userid,bidamount) values(@ItemID ,@UserId ,@BidAmount )
update items 
set currentprice=currentprice*@BidAmount
where ItemId=@ItemID
end
----
select *
from Users u join items i on u.userId=i.SellerId
---
select *
from Users u left join items i on u.userId=i.SellerId
---
select *
from Users u full outer join items i on u.userId=i.SellerId
---
select BidId,count(*)
from Bids b join items i on b.itemid=i.ItemId 
group by BidId
---
select userId,TotalAmount
from Users u join orders o on u.userId=o.buyerid
---
select *
from items i join Categories c on i.CategoryId=c.CategoryID
