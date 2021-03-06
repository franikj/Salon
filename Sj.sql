select * from Sales.Products

use Salon;

ALTER TABLE Sales.Products
ALTER COLUMN ProductID VARCHAR(50) NOT NULL

ALTER TABLE Sales.Writeoff WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE Sales.Products WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE Sales.Purchases WITH CHECK CHECK  CONSTRAINT ALL
ALTER TABLE Sales.Writeoff
ALTER COLUMN ProductID VARCHAR(50) NOT NULL

ALTER PROCEDURE [Sales].[CheckProductID]
( 
@ID INT,
@a INT OUTPUT
)
AS
BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000)

		IF @ID IN ( SELECT Products.ProductID FROM Sales.Products WHERE @ID=ProductID)
			BEGIN
		SET @a = 1
			END

		ELSE SET @a = 0
	PRINT @ErrorMessage
END
GO
--------------------
DECLARE @aa INT EXEC Sales.CheckProductID @ID=7, @a = @aa OUTPUT SELECT @aa 


select * from Sales.Products


USE [Salon]
GO
/****** Object:  StoredProcedure [Sales].[INS_Products]    Script Date: 01.06.2019 11:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [Sales].[INS_Products]
       (
		@ID INT ,
		@Name NVARCHAR(50),
		@Category NVARCHAR(50),
		@Amount INT,
		@Price1 DECIMAL,
		@price2 DECIMAL,
		@Description NVARCHAR(max) NULL		
	   )	 
	AS
BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000),
			@CategoryID INT = (SELECT ProductCategoryID FROM Sales.ProductCategory WHERE Name=@Category)
		--	@nam INT = (SELECT Amount FROM Sales.Products WHERE @ID=ProductID)
	
	IF @Name IN (SELECT Name FROM Sales.Products WHERE Name=@Name)
			BEGIN
				SET @ErrorMessage = 'Alredy exist';
			END

	--ELSE IF @ID IN ( SELECT Products.ProductID FROM Sales.Products WHERE @ID=ProductID)
	--		BEGIN
	--		DECLARE @am INT = @nam +1;
	--		END

		BEGIN TRANSACTION
			
		BEGIN TRY

		INSERT INTO Sales.Products
					  ( 
						ProductID,
						Name,
						ProductCategoryID,
						Amount,
						PurchasePrice,
						SellingPrice,
						Description
						      
					  ) 
				VALUES(	
						@ID,
						@Name,
						@CategoryID,
						@Amount,
						@Price1,
						@price2,
						@Description	
					  )
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO
------------------------------------------------
    --cs.registerOutParameter(3, java.sql.Types.VARCHAR);
    --cs.executeUpdate();
    --System.out.println(cs.getString(3));
    --con.close();
-----------------------------------------------------------

select * from Sales.ProductCategory
select * from Sales.Products

--------------------------------------------------------------------------------

ALTER PROCEDURE [Sales].[INS_Categories]
       (
		@Name NVARCHAR(50)		
	   )	 
	AS
BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000)
		BEGIN TRANSACTION
			
			BEGIN TRY
			declare @sql nvarchar(max) = '';
		declare @Name nvarchar(max)= 'лсв';
			SET @sql = 'INSERT INTO Sales.ProductCategory (Name) VALUES (N'''+@Name+''')';
			PRINT @sql
			EXEC (@sql)

		--INSERT INTO Sales.ProductCategory
		--			  ( 
		--				Name		      
		--			  ) 
		--		VALUES(	

		--				N''+@Name+''''
		--			  )
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO

  -----------------------------------------------------------------------------------
  use Salon
  ALTER PROCEDURE [Sales].INS_Sales
  ( @Product NVARCHAR(50)
  ,@Number int
  )
  AS
  BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000),
			@ProductID INT = (SELECT ProductID FROM Sales.Products WHERE Name=@Product), --get product id
			@Price int,
			@Pricefin int
	BEGIN TRANSACTION	
			BEGIN TRY

			DECLARE @PA INT = (SELECT Amount FROM Sales.Products WHERE ProductID=@ProductID)
			DECLARE @in INT = @PA-@Number;
			PRINT @PA
			PRINT @Number
							
			IF (@Number > @PA) OR @Number = 0 OR @Number IS NULL
			BEGIN
			 SET @ErrorMessage = 'Error'
			END  

			ELSE IF @in > 0 
			BEGIN			
			SET @Price = (SELECT SellingPrice FROM Sales.Products WHERE @ProductID=ProductID)
			SET @Pricefin = (@Price* @Number)
		INSERT INTO Sales.Purchases (
								
								ProductID,
								Number,
								Price
								)

					VALUES (
								@ProductID,
								@Number,
								@Pricefin
					)


			UPDATE Sales.Products SET Amount=@in WHERE ProductID=@ProductID
			END
			ELSE IF @in < 0
			BEGIN
			 SET @ErrorMessage = 'Error'
			END
			END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO 

select * from Sales.Purchases
select * from Sales.Products
select * from Sales.ProductCategory
---------------------------------------------------------------------------------------

ALTER PROCEDURE [Sales].DEL_Sales
  ( @ID NVARCHAR(50)
  )
  AS
  BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000),
			@ProductID INT = (SELECT ProductID FROM Sales.Purchases WHERE PurchasesID=@ID),
			@Number INT = (SELECT Number FROM Sales.Purchases WHERE PurchasesID=@ID)

	BEGIN TRANSACTION	
			BEGIN TRY

			DELETE FROM Sales.Purchases where PurchasesID=@ID;

			UPDATE Sales.Products
			SET Amount=Amount+@Number
			WHERE ProductID=@ProductID

			END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO 

---------------------------------------------------------------------------
 use Salon
  ALTER PROCEDURE [Sales].INS_Writeoff
  ( @Product NVARCHAR(50)
  ,@Number int
  ,@Description NVARCHAR(MAX)
  )
  AS
  BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000),
			@ProductID INT = (SELECT ProductID FROM Sales.Products WHERE Name=@Product), --get product id
			@Price int,
			@Pricefin int

	BEGIN TRANSACTION	
			BEGIN TRY

			DECLARE @PA INT = (SELECT Amount FROM Sales.Products WHERE ProductID=@ProductID)
			DECLARE @in INT = @PA-@Number;
			PRINT @PA
			PRINT @Number
							
			IF (@Number > @PA) OR @Number = 0 OR @Number IS NULL
			BEGIN
			 SET @ErrorMessage = 'Error'
			END  

			ELSE IF @in > 0 
			BEGIN			
			SET @Price = (SELECT SellingPrice FROM Sales.Products WHERE @ProductID=ProductID)
			SET @Pricefin = (@Price* @Number)
		INSERT INTO Sales.Writeoff(
								
								ProductID,
								Number,
								Price,
								Description
								)

					VALUES (
								@ProductID,
								@Number,
								@Pricefin,
								@Description
					)


			UPDATE Sales.Products SET Amount=@in WHERE ProductID=@ProductID
			END
			ELSE IF @in < 0
			BEGIN
			 SET @ErrorMessage = 'Error'
			END
			END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO 


select * from Sales.Writeoff
select * from Sales.Purchases
select * from Sales.Products
select * from ShowSales

EXEC SalesReport @datefrom='2019-09-30', @dateto='2019-06-05'

update Sales.Purchases SET Date='2019-05-04' where PurchasesID=1022
-----------------------------------------------------------------
use Salon

  CREATE PROCEDURE SalesReport
  ( @datefrom date
   ,@dateto date
  )
  AS
  BEGIN 
   
   SELECT p.PurchasesID AS ID, pc.Name AS Category, pp.Name AS Product, p.Number, p.Price, p.Date FROM Sales.Purchases p
   INNER JOIN Sales.Products pp ON pp.ProductID=p.ProductID
   INNER JOIN Sales.ProductCategory pc ON pc.ProductCategoryID=pp.ProductCategoryID
   WHERE p.Date BETWEEN @datefrom AND @dateto
	END
GO

INSERT INTO ADM.Administration values ('admin','hardpass')

CREATE PROCEDURE [Sales].DEL_Writeoff
  ( @ID NVARCHAR(50)
  )
  AS
  BEGIN 
   
	DECLARE @ErrorMessage VARCHAR(1000),
			@ProductID INT = (SELECT ProductID FROM Sales.Purchases WHERE PurchasesID=@ID),
			@Number INT = (SELECT Number FROM Sales.Purchases WHERE PurchasesID=@ID)

	BEGIN TRANSACTION	
			BEGIN TRY

			DELETE FROM Sales.Writeoff where WriteoffID=@ID;

			UPDATE Sales.Products
			SET Amount=Amount+@Number
			WHERE ProductID=@ProductID

			END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT @ErrorMessage
	END CATCH
IF @@TRANCOUNT > 0
COMMIT TRANSACTION
END
GO 

select * from Sales.Purchases
select * from Sales.Writeoff