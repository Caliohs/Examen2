CREATE PROCEDURE [dbo].DireccionObtener
@IdDireccion INT=null

AS BEGIN
	SET NOCOUNT ON

	SELECT

			D.IdDireccion
		,   D.Estado
		, D.DireccionExacta

		,   P.IdPersona
		,	P.Nombre

		,   CP.IdCatalogoProvincia
		,	CP.NombreCatalogoProvincia

		
		,   CC.IdCatalogoCanton
		,	CC.NombreCatalogoCanton


		,   CD.IdCatalogoDistrito
		,	CD.NombreCatalogoDistrito
	
		

		
	
				

	FROM dbo.Direccion D
	INNER JOIN dbo.Persona P
         ON D.IdPersona = P.IdPersona
	 INNER JOIN dbo.CatalogoProvincia CP
         ON D.IdCatalogoProvincia = CP.IdCatalogoProvincia
     INNER JOIN dbo.CatalogoCanton CC
         ON D.IdCatalogoCanton = CC.IdCatalogoCanton
	 INNER JOIN dbo.CatalogoDistrito CD
         ON D.IdCatalogoDistrito = CD.IdCatalogoDistrito
	 
	WHERE
	     (@IdDireccion IS NULL OR IdDireccion=@IdDireccion)

END