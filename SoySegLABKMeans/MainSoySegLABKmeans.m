%% Segmentacion de una imagen RGB a LAB+KMEANS
% Se toman los datos desde una imagen RGB, luego se convierte al espacio de
% colores L*a*b, se extraen los pixeles para luego agruparlos con el
% algoritmo KMEANS.
% 

%% Ajuste de parámetros iniciales
clc; clear all; close all;


nombreImagenP='calibracion_001.jpg';

 %% Definicion de estructura de directorios 
HOME=strcat(pwd,'/');
pathPrincipal=strcat(HOME,'SoyResults/byDisease/PSMet2/Segkmeans/');
pathEntradaAprender=strcat(HOME,'SoyResults/byDisease/PSMet2/LeavesEvaluation/tmpToLearn/removido/'); 

%% directorio para recortes
%pathAplicacionAprender=strcat(pathPrincipal,'tmpToLearnK/'); 

 %% Salida de clusters
pathAplicacionSalidaSeg=strcat(pathPrincipal,'tmpSegLAB/'); 

%% Llamado de función de clustering
% primero nombreImagenSegmentar y segundo nombreImagenSalida que es una
% salida parcial

numeroClusteres=5;


removeFiles(strcat(pathAplicacionSalidaSeg,'*.jpg'));

%carga del listado de nombres
listado=dir(strcat(pathEntradaAprender,'*.jpg'));

%% lectura en forma de bach del directorio de la cámara
for n=1:size(listado)
    fprintf('Extrayendo manchas-> %s \n',listado(n).name);    
    nombreImagenP=listado(n).name;
    %% salida segmentacion
    nombreImagenEntrada1=strcat(pathEntradaAprender,nombreImagenP);    
    nombreImagenSalida1=strcat(pathAplicacionSalidaSeg,nombreImagenP);
    
    fprintf('Clustering -> %s \n',listado(n).name);        
    fprintf('nombreImagenEntrada1 -> %s \n',nombreImagenEntrada1);        
    fprintf('nombreImagenSalida1 -> %s \n',nombreImagenSalida1);    
    ClusteringLABSoy(numeroClusteres, nombreImagenEntrada1, nombreImagenSalida1,'1');    
 
end %

