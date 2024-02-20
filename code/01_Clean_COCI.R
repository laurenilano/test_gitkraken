library(tidyverse)
library(here)

COCI <- read_csv("data/COCI-Program-Export-2023-09-12.csv") %>%
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

write_csv(pcn_top_xwalk, "out/pcn_top_xwalk_20230912.csv")

# TOP DESC
top_codes <- COCI %>%
  select(TOP_CODE, TOP_DESC) %>%
  mutate(TOP_CODE_STRING = gsub("\\.", "", TOP_CODE)) %>%
  distinct(TOP_CODE, .keep_all = TRUE)

<<<<<<< four-digit-tops
write_csv(top_codes, "Out/top_codes_20230912.csv")

=======
write_csv(top_codes, "out/top_codes_20230912.csv")
>>>>>>> get TOP Code crosswalks

<<<<<<< four-digit-tops
# 4-digit TOP
top4_codes <- COCI %>%
  select(TOP_CODE, TOP_DESC) %>%
  distinct(TOP_CODE, .keep_all = TRUE) %>%
  filter(grepl("*.00", TOP_CODE)) %>%
  mutate(TOP_CODE_STRING = gsub("\\.", "", TOP_CODE))

write_csv(top_codes, "out/top4_codes_20230912.csv")
<<<<<<< four-digit-tops
=======
=======
>>>>>>> remove four digit
  
>>>>>>> get TOP Code crosswalks
