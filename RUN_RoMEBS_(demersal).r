### Install RoMEBS packages and dependencies ###
library(tools)
install.packages("https://github.com/COISPA/R_libraries/raw/main/RoMEBS_0.2.02.zip", repos=NULL)
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


## Lines to read the new stratification data table to be used in RoMEBS
  ### modify the folder path in next line  ###
  str <- read.table("D:\\Documents and Settings\\Utente\\Documenti\\GitHub\\BioIndex\\R_BioIndex_3.1\\input\\Turchia Est\\Stratification.csv", sep=";", header=TRUE)
  str <- str[str$COUNTRY=="TUE",]

# Run RoMEBS
RoMEBS(DataTA, DataTB,DataTC,DataTE,DataTL,
       wd=wd, suffix,verbose=verbose,
       Strata=str,   #### this is the modified code line to call the new stratification table
       Ref_list=TM_list,
       LW_table = LW,
       TargetSpecies=DataTargetSpecies,
       Maturity=Maturity_parameters,
       mstages=mat_stages,
       ass_TL=assTL)
