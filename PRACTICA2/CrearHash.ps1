##KEILA CABALLERO##
#CREAR HASH POWERSHELL##

#VARIABLES
$url = Read-Host "Coloca el Path donde crearás los HASH de tus files " 
$doc = Get-ChildItem -Path $url                                               #Lista los files dentro del Path 
$var= Get-ChildItem -Path C:\Users\keila\OneDrive\Documentos\CARPETAHASH      #Directorio donde se guardarán los HASH #EL USUARIO DEBE CREAR ESTE DIRECTORIO
$archivo = Read-Host "Nombre del archivo donde guardarás tus HASH: "          #Se crea el archivo dentro del directorio donde se guardaran los HASH 
 
#FUNCION
function Get-Hash{
    param([Parameter(Mandatory)] [ValidateSet('Agregar', 'Actualizar')] [string] $Opción) 
    #IF
    if ($Opción -eq 'Agregar'){
        New-Item -ItemType "file" -Path C:\Users\keila\OneDrive\Documentos\CARPETAHASH\$archivo
        #CICLO

        foreach($file in $doc){
            Write-Host $file
            $hash = Get-FileHash -Algorithm MD5 $url"\"$file
            Write-Host $hash.Hash 
            Add-Content -Value $hash.hash -Path C:\Users\keila\OneDrive\Documentos\CARPETAHASH\$archivo
        }

    }else{

        foreach($file in $doc){
            Clear-Content -Path C:\Users\keila\OneDrive\Documentos\CARPETAHASH\$archivo
            Write-Host $file
            $hash = Get-FileHash -Algorithm MD5 $url"\"$file
            Write-Host $hash.Hash 
            Add-Content -Value $hash.hash -Path C:\Users\keila\OneDrive\Documentos\CARPETAHASH\$archivo
    
        }
    }
}

Get-Hash
