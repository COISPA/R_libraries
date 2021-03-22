### Install RoMEBS packages and dependencies ###
library(tools)
install.packages("https://github.com/COISPA/R_libraries/raw/main/RoMEBS_0.2.01.zip", repos=NULL)
packages <- c("svDialogs","MEDITS","timeDate","stringr","maps","sp","tcltk","ggplot2","rnaturalearth","rnaturalearthdata")
install.packages(setdiff(packages, rownames(installed.packages())))
library(RoMEBS)
library(tcltk)
####

## Select working directoty ##
wd <- tcltk::tk_choose.dir(getwd(), "Select the working directory")
suffix=NA
verbose= TRUE

## Load TX data and other tables ##

  DataTA = read.table(tcltk::tclvalue(tcltk::tkgetOpenFile(filetypes = "{ {CSV Files} {.csv} }",title="Select TA file")),sep=";",header = T)
  DataTB = read.table( tcltk::tclvalue(tcltk::tkgetOpenFile(filetypes = "{ {CSV Files} {.csv} }",title="Select TB file")),sep=";",header = T)
  DataTC = read.table(tcltk::tclvalue(tcltk::tkgetOpenFile(filetypes = "{ {CSV Files} {.csv} }",title="Select TC file")),sep=";",header = T)
  DataTE = NA     # read.table(tcltk::tclvalue(tcltk::tkgetOpenFile(filetypes = "{ {CSV Files} {.csv} }",title="Select TE file")),sep=";",header = T)
  DataTL = NA     # read.table(tcltk::tclvalue(tcltk::tkgetOpenFile(filetypes = "{ {CSV Files} {.csv} }",title="Select TL file")),sep=";",header = T)

## Run RoMEBS function ##
RoMEBS(DataTA, DataTB,DataTC,DataTE,DataTL,
       wd=wd, suffix,verbose=verbose,
       Strata=Stratification,
       Ref_list=TM_list,
       LW_table = LW,
       TargetSpecies=DataTargetSpecies,
       Maturity=Maturity_parameters,
       mstages=mat_stages,
       ass_TL=assTL)
