#!/bin/bash

# Limpiar proyecto Flutter
echo "Limpiando proyecto Flutter..."
flutter clean > /dev/null 2>&1
echo "Proyecto Flutter limpiado exitosamente."

# Eliminar pubspec.lock
echo "Eliminando pubspec.lock..."
rm pubspec.lock > /dev/null 2>&1
echo "pubspec.lock eliminado exitosamente."

# Eliminar Podfile.lock
echo "Eliminando Podfile.lock de la carpeta ios..."
rm ios/Podfile.lock > /dev/null 2>&1
echo "Podfile.lock eliminado exitosamente."

# Desintegre los pods
echo "Desintegrando pods de la carpeta ios..."
cd ios
pod deintegrate > /dev/null 2>&1
echo "Pods desintegrados exitosamente."

# Ejecutar script cleanbuild.sh
echo "Ejecutando script cleanbuild.sh..."
cd ..
./cleanbuild.sh > /dev/null 2>&1
echo "Script cleanbuild.sh ejecutado exitosamente."

# Ejecutar pod install
echo "Instalando pods de la carpeta ios..."
cd ios
pod install > /dev/null 2>&1
echo "Pods instalados exitosamente."

echo "Proceso completado exitosamente."
