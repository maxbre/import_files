#set wd
setwd("/home/max/Documenti/stat_r_test/import_files")

#define a vector of filenames
filenames <- list.files(pattern=".csv")

#import files and assign each a single df 

#by naming df as the file
for(i in filenames) {
  assign(i, read.csv(i, header=TRUE, sep="\t", stringsAsFactors=FALSE))  
}

#by naming df prepending "df_"
for(i in filenames) {
  assign(paste0("df_",i), read.csv(i, header=TRUE, sep="\t", stringsAsFactors=FALSE))  
}

#by naming df prepending "df_" and removing file extension
for(i in filenames) {
  assign(paste0("df_", gsub(".csv","", i)), read.csv(i, header=TRUE, sep="\t", stringsAsFactors=FALSE))  
}


#import files and merge them into a single df

df<-do.call("rbind", lapply(filenames, read.csv, header = TRUE, sep="\t", stringsAsFactors=FALSE)) 


df<-NULL
df<-c()
for(i in filenames) {
   df<-rbind(df,read.csv(i, header=TRUE, sep="\t", stringsAsFactors=FALSE))  
}
