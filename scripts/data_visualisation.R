# SOURCE FROGSPAWN SCRIPT ----
source("scripts/frogspawn.R")

# PLOT A BOXPLOT TO REPRESENT THE DATA
ggplot(data = frogs, aes(x = temperature, y = days)) +
  geom_boxplot(aes(fill = temperature), 
               alpha = 0.2, 
               width = 0.5,
               outlier.shape=NA)+
  geom_jitter(aes(colour = temperature),
              width=0.2)+
  theme_bw()+
  theme(legend.position = "none")
