# SOURCE FROGSPAWN SCRIPT ----
source("scripts/frogspawn.R")



ggplot(aes(x = age,
           y = died_covid,
           fill = died_covid),
       show.legend = FALSE) +
  xlim(0,106) +
  geom_boxplot() +
  labs(x = "Patient Age (Years)",
       y = "Number of Reports",
       fill = "Did the patient die from COVID-19?",
       title = "The Relationship Between Dying as a Result of COVID-19 and Age.",
       subtitle = "The reports of whether patients have died as a result of COVID-19, shown alongside the age of the patient. The median, interquartile ranges, ranges and outliers are represented by the middle line, box, 
whiskers and points, respectively.") +
  scale_fill_manual(values = c( "Yes" = "#3E4989", "No" = "#1F9E89" , "Under Review" = "#35D779")) +
  geom_text(x = 38, y = 0.55, label= "n = 38312") +
  geom_text(x = 76, y = 1.55, label= "n = 123") +
  geom_text(x = 76, y = 2.55, label = "n = 1336") + 
  theme_minimal() +
  theme(plot.title = element_text(face = "bold"),
        plot.subtitle = element_text(face = "italic")) 




# PLOT A BOXPLOT TO REPRESENT THE DATA
frogs_boxplot <- ggplot(data = frogs, aes(x = temperature, y = days)) +
  geom_boxplot(aes(fill = temperature), 
               alpha = 0.2, 
               width = 0.3,
               outlier.shape=NA)+
  labs(x = "Temperature (°C)",
       y = "Time Taken to Hatch (days)",
       title = "The Relationship Between Temperature and the Rate of Hatching in Frogspawn") +
  geom_jitter(aes(colour = temperature),
              width=0.2)+
  theme_bw()+
  theme(legend.position = "none",
        plot.title = element_text(face = "bold"))

ggsave("outputs/frogs_boxplot.png", width = 35, height = 25, units = "cm", dpi = 300)
