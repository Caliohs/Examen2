﻿CREATE PROCEDURE dbo.PersonaEliminar
 @IdPersona INT
  
AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRASA

	BEGIN TRY
	-- AQUI VA EL CODIGO
	DELETE FROM dbo.Direccion WHERE IdPersona=@IdPersona 
	--Elimino antes direcciones de esa persona para que no entre en conficto con las llaves
	
	DELETE FROM dbo.Persona WHERE IdPersona=@IdPersona


		COMMIT TRANSACTION TRASA
		
		SELECT 0 AS CodeError, '' AS MsgError



	END TRY

	BEGIN CATCH
		SELECT 
				ERROR_NUMBER() AS CodeError
			,	ERROR_MESSAGE() AS MsgError

			ROLLBACK TRANSACTION TRASA
	END CATCH


END