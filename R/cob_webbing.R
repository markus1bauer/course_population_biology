# Course population biology
# Cob-webbing the recruitment curve ####

# Markus Bauer
# 2023-10-12

### Packages ###
library(here)
library(tidyverse)
library(renv)
library(ggbeeswarm)
library(patchwork)

### Start ###
rm(list = ls())
renv::status()

### Functions ###
theme_mb <- function() {
  theme(
    panel.background = element_rect(fill = NA),
    axis.line = element_line(),
    text = element_text(size = 10, color = "black"),
    legend.key = element_rect(fill = "white"),
    legend.margin = margin(0, 0, 0, 0, "cm"),
    plot.margin = margin(.5, .5, 0, 0, "cm")
  )
}



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# A Plotten ####################################################################
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



## 1 Draw single plots ########################################################


graph_a <- ggplot() +
  geom_abline(intercept = -2.5, slope = 1.5) +
  geom_abline(intercept = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  labs(x = expression(N[t]), y = expression(N[t+1])) +
  coord_fixed() +
  theme_mb()
graph_b <- ggplot() +
  geom_abline(intercept = 10, slope = -1) +
  geom_abline(intercept = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  labs(x = expression(N[t]), y = expression(N[t+1])) +
  coord_fixed() +
  theme_mb()
graph_c <- ggplot() +
  geom_abline(intercept = 10, slope = -1.2) +
  geom_abline(intercept = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  labs(x = expression(N[t]), y = expression(N[t+1])) +
  coord_fixed() +
  theme_mb()
graph_d <- ggplot() +
  geom_abline(intercept = 6, slope = -0.3) +
  geom_abline(intercept = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  labs(x = expression(N[t]), y = expression(N[t+1])) +
  coord_fixed() +
  theme_mb()
graph_e <- ggplot(data = tibble(x = 3), aes(x)) +
  geom_function(fun = log, args = list(1.3)) +
  geom_abline(intercept = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  labs(x = expression(N[t]), y = expression(N[t+1])) +
  coord_fixed() +
  theme_mb()
graph_f <- ggplot(data = tibble(x = 3), aes(x)) +
  geom_abline(intercept = 5, slope = 0, linetype = "dashed") +
  scale_y_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 10), expand = c(0, 0)
  ) +
  scale_x_continuous(
    breaks = seq(0, 10, by = 1), limits = c(0, 6), expand = c(0, 0)
  ) +
  labs(y = expression(N[t+1]), x = expression(t)) +
  theme_mb()


## 2 Put plots together ########################################################


graph_a +
  graph_b + graph_c + graph_d + graph_e + graph_f +
  plot_layout(nrow = 2, guides = "keep") +
  plot_annotation(tag_levels = "A")

graph_f +
  graph_f + graph_f + graph_f + graph_f +
  plot_layout(nrow = 2, guides = "keep") +
  plot_annotation(tag_levels = "A")



#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# B Save ######################################################################
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


ggsave(
  here("outputs", "figures", "cob_webbing_recruitement.tiff"),
  dpi = 300, width = 19, height = 12, units = "cm"
)

ggsave(
  here("outputs", "figures", "cob_webbing_dynamics.tiff"),
  dpi = 300, width = 19, height = 12, units = "cm"
)
