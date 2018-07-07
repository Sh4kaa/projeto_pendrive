@echo off
mode con lines=22 cols=86
echo>list.txt 
echo>list.txt list disk
@echo off
diskpart -s list.txt
@echo off
echo.

set /p disco="Entre com o Disco: "
echo.
:inicio
set formi=0
set /p formi="Qual formato? [1]-ntfs [2]-fat32 :"
if %formi% == 1 (
set formi=ntfs) else (
	if %formi% == 2 (
set formi=fat32) else (
		cls
			echo.
			echo OPCAO INVALIDA
			pause > nul
			cls
			goto INICIO))
echo:
echo>move.txt
echo>move.txt list disk
echo>>move.txt select disk %disco%
echo>>move.txt clean
echo>>move.txt Create Partition Primary
echo>>move.txt format fs=%formi% quick
echo>>move.txt active
echo>>move.txt assign
@echo off
diskpart -s move.txt
del /f move.txt
del /f list.txt

echo Formatado com sucesso!!!
echo.
echo.
echo By Dario
pause > nul

