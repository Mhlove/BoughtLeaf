

 alter PROCEDURE [dbo].[SPAddNewMonth]
	(
	@nxYear int,
	@nxMonth int,
	@nxStDate datetime,
	@userId varchar(50),
	@state varchar(50) output
	)
	AS
	begin
/*V0.13SPAddNewMonth-2018-8-14*/
		if not exists(SELECT  MonthCode, MonthName, Year, Process FROM dbo.Month WHERE (Year = @nxYear) AND (MonthCode = @nxMonth))
		begin
			INSERT INTO [dbo].[Month] ([MonthCode] ,[MonthName] ,[Process] ,[Year])
			VALUES (@nxMonth ,DateName(month,@nxStDate) ,0 ,@nxYear)
			set @state='ADDED'
		end
		
	end









