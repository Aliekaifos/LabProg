import folium
import os
from folium import plugins
from geopy.geocoders import Nominatim
import time

lista = [{'Lat': 48.8573785, 'Lng': 2.296264299722222},
         {'Lat': 25.7255408, 'Lng': -100.31533249972222},
         {'Lat': 33.8058636, 'Lng': -117.9206596}]

listadat = []
listanom = []

for i in lista:
    listadat.append(list(i.values()))
#print(listadat)

for i in lista:
    uno = str(i['Lat'])
    dos = str(i['Lng'])
    listanom.append(uno+","+dos)
#print(listanom)


mapa = folium.Map(location=listadat[0], zoom_start=12)
count = 0
for i in listadat:
    geolocalizador = Nominatim(user_agent="Prueba")
    ubicacion = geolocalizador.reverse(listanom[count])
    ubi = ubicacion.raw['display_name']
    mapa.add_child(plugins.HeatMap([i]))
    mapa.add_child(folium.Marker(location=i,icon=folium.Icon(color="red"),popup=ubi))
    time.sleep(3)
    count += 1

path = os.getcwd()
mapa.save(path+"\Mapa.html")
print("Archivo guardado en: ", path)
