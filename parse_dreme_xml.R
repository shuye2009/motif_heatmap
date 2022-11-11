# Load the library
library(xml2)
library(XML)
library(dplyr)
# Read the xml file
motif_data <- read_xml('C:/GREENBLATT/Nabeel/Gio/cits_peaks/Feb2022_analysis/dreme_combined_CITS_0.01_m6AHek.recurring_noInput/dreme.xml')

motif_xml <- xmlParse(motif_data)

motif <- xml_find_all(motif_data, xpath = "//motifs/motif/match")

seq <- xml_attr(motif, "seq")
eval <- xml_attr(motif, "evalue")

df <- data.frame(Motif=seq, Evalue=as.numeric(eval)) %>%
   mutate(Score=-log(Evalue)) %>%
   filter(Score > 0)
df
