--create database VentaEntradas

--CREATE TABLE TipoEvento (
--    TipoEvento_Id INT PRIMARY KEY,
--    TipoEvento_Nombre NVARCHAR(100) NOT NULL,
--    Deportivo BIT NOT NULL,
--    Cultural BIT NOT NULL
--);

--CREATE TABLE Usuario (
--    Usuario_Id INT PRIMARY KEY,
--    Usuario_Nombre NVARCHAR(100) NOT NULL,
--    Password NVARCHAR(255) NOT NULL,
--    Email NVARCHAR(100) NOT NULL,
--    Fecha_Creacion DATETIME NOT NULL DEFAULT GETDATE(),
--    Fecha_Modificacion DATETIME
--);

--creacion de tabla temporal
--SELECT * INTO Usuario_Temp
--FROM Usuario;
----eliminar tabla original
--DROP TABLE Usuario;



--CREATE TABLE Evento (
--    Evento_Id INT IDENTITY(1,1) PRIMARY KEY,
--    TipoEvento_Id INT,
--    Usuario_Id INT,
--    FechaEvento DATE NOT NULL,
--    LugarEvento NVARCHAR(255) NOT NULL,
--    Descripcion NVARCHAR(1000),
--    Precio DECIMAL(10, 2) NOT NULL,
--    Estado NVARCHAR(50) NOT NULL,
--    Fecha_Creacion DATETIME NOT NULL DEFAULT GETDATE(),
--    Fecha_Modificacion DATETIME,
--    FOREIGN KEY (TipoEvento_Id) REFERENCES TipoEvento(TipoEvento_Id),
--    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Usuario_Id)
--);


--CREATE PROCEDURE SP_InsertaTipoEvento
--    @TipoEvento_Id INT,
--    @TipoEvento_Nombre NVARCHAR(100),
--    @Deportivo BIT,
--    @Cultural BIT,
--    @Codigo INT OUTPUT,
--    @Mensaje NVARCHAR(100) OUTPUT
--AS
--BEGIN
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        INSERT INTO TipoEvento (TipoEvento_Id, TipoEvento_Nombre, Deportivo, Cultural)
--        VALUES (@TipoEvento_Id, @TipoEvento_Nombre, @Deportivo, @Cultural);

--        SET @Codigo = 0;
--        SET @Mensaje = 'Inserción exitosa.';

--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;

--        SET @Codigo = ERROR_NUMBER();
--        SET @Mensaje = ERROR_MESSAGE();
--    END CATCH;
--END;


--DECLARE @codigo INT, @mensaje NVARCHAR(100);
--EXEC SP_InsertaTipoEvento
--    @TipoEvento_Id = 2,
--    @TipoEvento_Nombre = 'Concierto',
--    @Deportivo = 0,
--    @Cultural = 1,
--    @codigo = @codigo  OUTPUT,
--    @mensaje = @mensaje OUTPUT

--PRINT 'Código: ' + CAST(@codigo AS NVARCHAR(10));
--PRINT 'Mensaje: ' + @mensaje;

--CREATE PROCEDURE SP_InsertaUsuario
--    @Usuario_Id INT,
--    @Usuario_Nombre NVARCHAR(100),
--    @Password NVARCHAR(255),
--    @Email NVARCHAR(100),
--    @Codigo INT OUTPUT,
--    @Mensaje NVARCHAR(100) OUTPUT
--AS
--BEGIN
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        INSERT INTO Usuario (Usuario_Id, Usuario_Nombre, Password, Email, Fecha_Creacion)
--        VALUES (@Usuario_Id, @Usuario_Nombre, @Password, @Email, GETDATE());

--        SET @Codigo = 0;
--        SET @Mensaje = 'Inserción exitosa.';

--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;

--        SET @Codigo = ERROR_NUMBER();
--        SET @Mensaje = ERROR_MESSAGE();
--    END CATCH;
--END;

--DECLARE @codigo INT, @mensaje NVARCHAR(100);
--EXEC SP_InsertaUsuario
--    @Usuario_Id = 2,
--    @Usuario_Nombre = 'Maria Valdez',
--    @Password = 'PASS456',
--    @Email = 'maria.valdez@example.com',
--    @codigo = @codigo  OUTPUT,
--    @mensaje = @mensaje OUTPUT

--PRINT 'Código: ' + CAST(@codigo AS NVARCHAR(10));
--PRINT 'Mensaje: ' + @mensaje;

--CREATE PROCEDURE SP_InsertaEvento
--    @TipoEvento_Id INT,
--    @Usuario_Id INT,
--    @FechaEvento DATE,
--    @LugarEvento NVARCHAR(255),
--    @Descripcion NVARCHAR(1000),
--    @Precio DECIMAL(10, 2),
--    @Estado NVARCHAR(50),
--    @Codigo INT OUTPUT,
--    @Mensaje NVARCHAR(100) OUTPUT
--AS
--BEGIN
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        INSERT INTO Evento (TipoEvento_Id, Usuario_Id, FechaEvento, LugarEvento, Descripcion, Precio, Estado, Fecha_Creacion)
--        VALUES (@TipoEvento_Id, @Usuario_Id, @FechaEvento, @LugarEvento, @Descripcion, @Precio, @Estado, GETDATE());

--        SET @Codigo = 0;
--        SET @Mensaje = 'Inserción exitosa.';

--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;

--        SET @Codigo = ERROR_NUMBER();
--        SET @Mensaje = ERROR_MESSAGE();
--    END CATCH;
--END;

--DECLARE @codigo INT, @mensaje NVARCHAR(100);
--EXEC SP_InsertaEvento
--    @TipoEvento_Id = 2,
--    @Usuario_Id = 2,
--    @FechaEvento = '2024-08-02',
--    @LugarEvento = 'Casa de la Cultura',
--    @Descripcion = 'Concierto de los Diamantes',
--    @Precio = 10.00,
--    @Estado = 'Activo',
--    @codigo = @codigo  OUTPUT,
--    @mensaje = @mensaje OUTPUT

--PRINT 'Código: ' + CAST(@codigo AS NVARCHAR(10));
--PRINT 'Mensaje: ' + @mensaje;

--consultas

--CREATE PROCEDURE AP_ObtenerEventoPorId
--    @Evento_Id INT
--AS
--BEGIN
--    SELECT * FROM Evento
--    WHERE Evento_Id = @Evento_Id;
--END;

--CREATE PROCEDURE SP_ActualizarEvento
--    @Evento_Id INT,
--    @TipoEvento_Id INT,
--    @Usuario_Id INT,
--    @FechaEvento DATE,
--    @LugarEvento NVARCHAR(255),
--    @Descripcion NVARCHAR(1000),
--    @Precio DECIMAL(10, 2),
--    @Estado NVARCHAR(50),
--    @Codigo INT OUTPUT,
--    @Mensaje NVARCHAR(100) OUTPUT
--AS
--BEGIN
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        UPDATE Evento
--        SET 
--            TipoEvento_Id = @TipoEvento_Id,
--            Usuario_Id = @Usuario_Id,
--            FechaEvento = @FechaEvento,
--            LugarEvento = @LugarEvento,
--            Descripcion = @Descripcion,
--            Precio = @Precio,
--            Estado = @Estado,
--            Fecha_Modificacion = GETDATE()
--        WHERE Evento_Id = @Evento_Id;

--        SET @Codigo = 0;
--        SET @Mensaje = 'Actualización exitosa.';

--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;

--        SET @Codigo = ERROR_NUMBER();
--        SET @Mensaje = ERROR_MESSAGE();
--    END CATCH;
--END;

--CREATE PROCEDURE SP_EliminarEvento
--    @Evento_Id INT,
--    @Codigo INT OUTPUT,
--    @Mensaje NVARCHAR(100) OUTPUT
--AS
--BEGIN
--    BEGIN TRY
--        BEGIN TRANSACTION;

--        UPDATE Evento
--        SET 
--            Estado = 'Eliminado',
--            Fecha_Modificacion = GETDATE()
--        WHERE Evento_Id = @Evento_Id;
--        SET @Codigo = 0;
--        SET @Mensaje = 'Eliminación lógica exitosa.';
--        COMMIT TRANSACTION;
--    END TRY
--    BEGIN CATCH
--        ROLLBACK TRANSACTION;

--        SET @Codigo = ERROR_NUMBER();
--        SET @Mensaje = ERROR_MESSAGE();
--    END CATCH;
--END;

--CREATE PROCEDURE SP_ObtenerTodosLosEventos
--AS
--BEGIN
--    SELECT * FROM Evento;
--END;


EXEC SP_ObtenerTodosLosEventos;--TODOS LOS EVENTOS
EXEC AP_ObtenerEventoPorId @Evento_Id = 2;--SOLO POR SU ID

DECLARE @Codigo INT;
DECLARE @Mensaje NVARCHAR(100);

EXEC AP_ObtenerEventoPorId 
    @Evento_Id = 10,
    @Codigo = @Codigo OUTPUT,
    @Mensaje = @Mensaje OUTPUT;
SELECT @Codigo AS Codigo, @Mensaje AS Mensaje;

--ACTUALIZAR UN EVENTO
--DECLARE @Codigo INT;
--DECLARE @Mensaje NVARCHAR(100);

--EXEC sp_ActualizarEvento 
--    @Evento_Id = 2,
--    @TipoEvento_Id = 2,
--    @Usuario_Id = 2,
--    @FechaEvento = '2024-09-02',
--    @LugarEvento = 'Casa de la Cultura',
--    @Descripcion = 'Concierto de música clásica',
--    @Precio = 15.00,
--    @Estado = 'Activo',
--    @Codigo = @Codigo OUTPUT,
--    @Mensaje = @Mensaje OUTPUT;
--SELECT @Codigo AS Codigo, @Mensaje AS Mensaje;

DECLARE @Codigo INT;
DECLARE @Mensaje NVARCHAR(100);

EXEC SP_EliminarEvento 
    @Evento_Id = 2,
    @Codigo = @Codigo OUTPUT,
    @Mensaje = @Mensaje OUTPUT;

SELECT @Codigo AS Codigo, @Mensaje AS Mensaje;



SELECT * FROM Usuario;
SELECT * FROM Evento;
SELECT * FROM TipoEvento;


    SELECT U.Usuario_Nombre,TE.TipoEvento_Nombre,E.FechaEvento,E.LugarEvento,E.Descripcion,E.Precio
	FROM Evento E
	INNER JOIN Usuario U ON U.Usuario_Id = E.Usuario_Id
	INNER JOIN TipoEvento TE ON TE.TipoEvento_Id = E.TipoEvento_Id
    WHERE Evento_Id = 2;