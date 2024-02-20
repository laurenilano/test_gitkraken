setwd("~/Dropbox/MMAP/Data/COCI Major")

library(tidyverse)

COCI <- read_csv("COCI-Program-Export-2023-09-12.csv") %>%
  rename(Program_Control_Number = "CONTROL NUMBER") %>%
  mutate(TOP_CODE = gsub("[^0-9.-]", "", `TOP CODE`),
         TOP_DESC = gsub("[0-9].[0-9]", "", `TOP CODE`),
         TOP_DESC = gsub("\\*", "", TOP_DESC),
         TOP_DESC = gsub("[0]", "", TOP_DESC)) %>%
  select(-`TOP CODE`) %>%
  mutate(CIP_CODE = gsub("[^0-9.-]", "", `CIP CODE`),
         CIP_CODE = gsub("\\.", "", CIP_CODE),
         CIP_DESC = gsub("[0-9].[0-9]", "", `CIP CODE`),
         CIP_DESC = gsub("\\*", "", CIP_DESC),
         CIP_DESC = gsub("[0-9]", "", CIP_DESC)) %>%
  select(-`CIP CODE`)


# PCN-TOP XWALK
pcn_top_xwalk <- COCI %>%
  select(Program_Control_Number, TOP_CODE, TOP_DESC) %>%
  distinct()

write_csv(pcn_top_xwalk, "Out/pcn_top_xwalk_20230912.csv")

# TOP DESC
top_codes <- COCI %>%
  select(TOP_CODE, TOP_DESC) %>%
  mutate(TOP_CODE_STRING = gsub("\\.", "", TOP_CODE)) %>%
  distinct(TOP_CODE, .keep_all = TRUE)

write_csv(top_codes, "Out/top_codes_20230912.csv")
