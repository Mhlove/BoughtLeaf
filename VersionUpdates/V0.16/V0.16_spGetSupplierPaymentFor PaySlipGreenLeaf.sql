

-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetSupplierPaymentForPaySlipGreenLeaf]  
	-- Add the parameters for the stored procedure here
	@PayYear int = 2017,
	@PayMonth int = 7,
	@RouteCode varchar(50) ='FAC'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @SupplierCode Varchar(50)
	DECLARE @CollectedDate Datetime
	DECLARE @GreenLeafCollected decimal(18,2)
	declare @DayNumber int
	declare @sqlStr Varchar(5000)
	declare @ColDay varchar (50)


	Create table #temp (SupplierCode varchar (50),
	RouteCode varchar(50) default '',
	Day01 decimal(18,2) default 0,
	Day02 decimal(18,2) default 0,
	Day03 decimal(18,2) default 0,
	Day04 decimal(18,2) default 0,
	Day05 decimal(18,2) default 0,
	Day06 decimal(18,2) default 0,
	Day07 decimal(18,2) default 0,
	Day08 decimal(18,2) default 0,
	Day09 decimal(18,2) default 0,
	Day10 decimal(18,2) default 0,
	Day11 decimal(18,2) default 0,
	Day12 decimal(18,2) default 0,
	Day13 decimal(18,2) default 0,
	Day14 decimal(18,2) default 0,
	Day15 decimal(18,2) default 0,
	Day16 decimal(18,2) default 0,
	Day17 decimal(18,2) default 0,
	Day18 decimal(18,2) default 0,
	Day19 decimal(18,2) default 0,
	Day20 decimal(18,2) default 0,
	Day21 decimal(18,2) default 0,
	Day22 decimal(18,2) default 0,
	Day23 decimal(18,2) default 0,
	Day24 decimal(18,2) default 0,
	Day25 decimal(18,2) default 0,
	Day26 decimal(18,2) default 0,
	Day27 decimal(18,2) default 0,
	Day28 decimal(18,2) default 0,
	Day29 decimal(18,2) default 0,
	Day30 decimal(18,2) default 0,
	Day31 decimal(18,2) default 0,
	PayYear int default 0,
    PayMonth int default 0
	)
	DECLARE  @GreenLeafCursor CURSOR
	declare SupplierCursor cursor 
	FOR
	select Supplier.SupplierCode from dbo.Supplier where dbo.Supplier.RouteCode=@RouteCode order by SupplierCode
	OPEN SupplierCursor
	FETCH NEXT FROM SupplierCursor INTO @SupplierCode
	WHILE @@FETCH_STATUS = 0  
	BEGIN
	print 'Supp - '+@SupplierCode
	
	if  exists (SELECT        TOP (100) PERCENT dbo.DailyGreenLeaf.CollectedDate, dbo.DailyGreenLeaf.GreenLeafCollected AS Expr1
FROM            dbo.DailyGreenLeaf INNER JOIN
                         dbo.Supplier ON dbo.DailyGreenLeaf.SupplierCode = dbo.Supplier.SupplierCode
WHERE        (YEAR(dbo.DailyGreenLeaf.CollectedDate) = @PayYear) AND (MONTH(dbo.DailyGreenLeaf.CollectedDate) = @PayMonth) AND (dbo.Supplier.RouteCode = @RouteCode) AND (dbo.DailyGreenLeaf.SupplierCode = @SupplierCode)
ORDER BY dbo.DailyGreenLeaf.SupplierCode, dbo.DailyGreenLeaf.CollectedDate)
	begin
			SET @GreenLeafCursor = CURSOR FOR  
			
			SELECT [CollectedDate],sum(dbo.DailyGreenLeaf.NetWeight) FROM [dbo].[DailyGreenLeaf] INNER JOIN [dbo].[Supplier]
			ON [DailyGreenLeaf].SupplierCode = [dbo].[Supplier].SupplierCode
			WHERE  year([CollectedDate]) = @PayYear and month([CollectedDate]) = @PayMonth and [dbo].[Supplier].RouteCode = @RouteCode and [DailyGreenLeaf].[SupplierCode]=@SupplierCode
			GROUP BY [DailyGreenLeaf].[SupplierCode],[CollectedDate]
			ORDER BY [DailyGreenLeaf].[SupplierCode],[CollectedDate]
			OPEN @GreenLeafCursor
			FETCH NEXT FROM @GreenLeafCursor INTO @CollectedDate,@GreenLeafCollected
			WHILE @@FETCH_STATUS = 0  
			BEGIN
	
			SET @DayNumber  = day(@CollectedDate)
			--print @SupplierCode
			--print @DayNumber
			set @ColDay = 'Day' + Right(('00'+ Convert(varchar(2),(@DayNumber))),2)
			--print @ColDay
			if not exists (select 1 from #temp where SupplierCode = @SupplierCode)
			begin
			--set @sqlStr =  'INSERT INTO #temp (SupplierCode,' + @ColDay + ',PayYear,PayMonth)Values('''+ @SupplierCode +''',''' + Convert(varchar(10),(@GreenLeafCollected) )+ ''',''' + Convert(varchar(4),@PayYear) + ''',''' + Convert(varchar(2),@PayMonth) + ''')'
				set @sqlStr =  'INSERT INTO #temp (SupplierCode,RouteCode,' + @ColDay + ',PayYear,PayMonth)Values('''+ @SupplierCode +''',''' + @RouteCode + ''',''' + Convert(varchar(10),(@GreenLeafCollected) )+ ''',''' + Convert(varchar(4),@PayYear) + ''',''' + Convert(varchar(2),@PayMonth) + ''')'

			end
			else
			begin
			set @sqlStr = 'UPDATE #temp SET '+ @ColDay + '='+ convert(varchar(10),(@GreenLeafCollected)) + ' WHERE SupplierCode =''' + @SupplierCode + ''''
			end
			--print @sqlStr
			exec(@sqlStr)


			FETCH NEXT FROM @GreenLeafCursor INTO @CollectedDate,@GreenLeafCollected
			END
			CLOSE @GreenLeafCursor
			DEALLOCATE @GreenLeafCursor

	end
	else
	begin
	-----------
	if exists (SELECT        CFDebtBalance
FROM            dbo.MonthlyPaymentSummary
WHERE        (Year = @PayYear) AND (Month = @PayMonth) AND (SupplierCode = @SupplierCode) and (CFDebtBalance>0))
begin
			SET @DayNumber  = day(CONVERT(DATETIME, convert(varchar(50),convert(varchar(10),@PayYear)+'-'+convert(varchar(10),@PayMonth)+'-1', 102) ))
			--print @SupplierCode
			--print @DayNumber
			set @ColDay = 'Day' + Right(('00'+ Convert(varchar(2),(@DayNumber))),2)
			--print @ColDay
			if not exists (select 1 from #temp where SupplierCode = @SupplierCode)
			begin
			--set @sqlStr =  'INSERT INTO #temp (SupplierCode,' + @ColDay + ',PayYear,PayMonth)Values('''+ @SupplierCode +''',''' + Convert(varchar(10),(@GreenLeafCollected) )+ ''',''' + Convert(varchar(4),@PayYear) + ''',''' + Convert(varchar(2),@PayMonth) + ''')'
				set @sqlStr =  'INSERT INTO #temp (SupplierCode,RouteCode,' + @ColDay + ',PayYear,PayMonth)Values('''+ @SupplierCode +''',''' + @RouteCode + ''',0,''' + Convert(varchar(4),@PayYear) + ''',''' + Convert(varchar(2),@PayMonth) + ''')'

			end
			else
			begin
			set @sqlStr = 'UPDATE #temp SET '+ @ColDay + '=0' + ' WHERE SupplierCode =''' + @SupplierCode + ''''
			end
			--print @sqlStr
			exec(@sqlStr)
	end
	-----------
	end

	FETCH NEXT FROM SupplierCursor INTO  @SupplierCode
	END
	CLOSE SupplierCursor
	DEALLOCATE SupplierCursor

	select * from #temp
END





