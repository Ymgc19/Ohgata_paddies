# packages
library(tidyverse)
library(sf)
library(mapview)
library(raster)
library(exactextractr)
library(patchwork)

# 大潟村の筆ポリゴン
fude <- read_sf("05368大潟村（2021公開）/05368大潟村（2021公開）_5.shp",
                options = "ENCODING=CP932") %>% 
  filter(耕地の種類 == "田")
fude %>% glimpse()




# ===================== 2024年八郎潟データ ==================== #
# 田植え後のVH
after_2024 <- raster("sar_data/2024_VH_after.tif")
#after_2024 %>% raster::plot()
# 水田ごとの平均値
fude$after_2024 <- exact_extract(after_2024, fude, "mean")

# 田植え前とのVH差分
diff_2024 <- raster("sar_data/2024_VH_diff.tif")
#diff_2024 %>% raster::plot()
fude$diff_2024 <- exact_extract(diff_2024, fude, "mean")


# ===================== 2023年八郎潟データ ==================== #
# 田植え後のVH
after_2023 <- raster("sar_data/2023_VH_after.tif")
#after_2023 %>% raster::plot()
fude$after_2023 <- exact_extract(after_2023, fude, "mean")

# 田植え前とのVH差分
diff_2023 <- raster("sar_data/2023_VH_diff.tif")
#diff_2023 %>% raster::plot()
fude$diff_2023 <- exact_extract(diff_2023, fude, "mean")

# ===================== 2022年八郎潟データ ==================== #
# 田植え後のVH
after_2022 <- raster("sar_data/2022_VH_after.tif")
#after_2022 %>% raster::plot()
fude$after_2022 <- exact_extract(after_2022, fude, "mean")

# 田植え前とのVH差分
diff_2022 <- raster("sar_data/2022_VH_diff.tif")
#diff_2022 %>% raster::plot()
fude$diff_2022 <- exact_extract(diff_2022, fude, "mean")


# ===================== 2021年八郎潟データ ==================== #
# 田植え後のVH
after_2021 <- raster("sar_data/2021_VH_after.tif")
#after_2021 %>% raster::plot()
fude$after_2021 <- exact_extract(after_2021, fude, "mean")

# 田植え前とのVH差分
diff_2021 <- raster("sar_data/2021_VH_diff.tif")
#diff_2021 %>% raster::plot()
fude$diff_2021 <- exact_extract(diff_2021, fude, "mean")

# ===================== 2020年八郎潟データ ==================== #
# 田植え後のVH
after_2020 <- raster("sar_data/2020_VH_after.tif")
#after_2020 %>% raster::plot()
fude$after_2020 <- exact_extract(after_2020, fude, "mean")

# 田植え前とのVH差分
diff_2020 <- raster("sar_data/2020_VH_diff.tif")
#diff_2020 %>% raster::plot()
fude$diff_2020 <- exact_extract(diff_2020, fude, "mean")

# ===================== 2019年八郎潟データ ==================== #
# 田植え後のVH
after_2019 <- raster("sar_data/2019_VH_after.tif")
#after_2019 %>% raster::plot()
fude$after_2019 <- exact_extract(after_2019, fude, "mean")

# 田植え前とのVH差分
diff_2019 <- raster("sar_data/2019_VH_diff.tif")
#diff_2019 %>% raster::plot()
fude$diff_2019 <- exact_extract(diff_2019, fude, "mean")


# ===================== 2018年八郎潟データ ==================== #
# 田植え後のVH
after_2018 <- raster("sar_data/2018_VH_after.tif")
#after_2018 %>% raster::plot()
fude$after_2018 <- exact_extract(after_2018, fude, "mean")

# 田植え前とのVH差分
diff_2018 <- raster("sar_data/2018_VH_diff.tif")
#diff_2018 %>% raster::plot()
fude$diff_2018 <- exact_extract(diff_2018, fude, "mean")


# ===================== 2017年八郎潟データ ==================== #
# 田植え後のVH
after_2017 <- raster("sar_data/2017_VH_after.tif")
#after_2017 %>% raster::plot()
fude$after_2017 <- exact_extract(after_2017, fude, "mean")

# 田植え前とのVH差分
diff_2017 <- raster("sar_data/2017_VH_diff.tif")
#diff_2017 %>% raster::plot()
fude$diff_2017 <- exact_extract(diff_2017, fude, "mean")





# ==================== 偏波VHの描画 ==================== #
# 2017
VH_2017 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2017),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2017") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2018
VH_2018 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2018),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2018") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2019
VH_2019 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2019),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2019") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2020
VH_2020 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2020),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2020") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2021
VH_2021 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2021),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2021") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2022
VH_2022 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2022),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2022") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2023
VH_2023 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2023),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2023") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2024
VH_2024 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = after_2024),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato", limits = c(-35, 0)
  ) +
  labs(fill = "", x = "2024") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# まとめて可視化
VH_2017 + VH_2018 + VH_2019 + VH_2020 +
  VH_2021 + VH_2022 + VH_2023 + VH_2024 + plot_layout(nrow = 2)








# ==================== 偏波VHの描画 ==================== #
# 2017
diff_2017 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2017),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2017") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2018
diff_2018 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2018),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2018") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2019
diff_2019 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2019),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2019") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2020
diff_2020 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2020),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2020") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2021
diff_2021 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2021),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2021") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())


# 2022
diff_2022 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2022),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2022") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())

# 2023
diff_2023 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2023),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2023") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())


# 2024
diff_2024 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = diff_2024),
    color = NA
  ) +
  scale_fill_gradient(
    low = "cyan", high = "tomato"
  ) +
  labs(fill = "", x = "2024") +
  theme_minimal() +
  theme(legend.position = "none",
        axis.text = element_blank())


# まとめて可視化
diff_2017 + diff_2018 + diff_2019 + diff_2020 +
  diff_2021 + diff_2022 + diff_2023 + diff_2024 + plot_layout(nrow = 2)




# ============================== 閾値に基づいた判別 ================================ #
fude %>% glimpse()
fude <- fude %>% 
  mutate(
    kousaku_2017 = case_when(
      (after_2017 > -20) & (diff_2017 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2018 = case_when(
      (after_2018 > -20) & (diff_2018 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2019 = case_when(
      (after_2019 > -20) & (diff_2019 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2020 = case_when(
      (after_2020 > -20) & (diff_2020 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2021 = case_when(
      (after_2021 > -20) & (diff_2021 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2022 = case_when(
      (after_2022 > -20) & (diff_2022 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2023 = case_when(
      (after_2023 > -20) & (diff_2023 > -8) ~ "0",
      TRUE ~ "1"
    ),
    kousaku_2024 = case_when(
      (after_2024 > -20) & (diff_2024 > -8) ~ "0",
      TRUE ~ "1"
    )
  )

# ========== 可視化 ========== #
map_2017 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2017),
    color = NA
  ) +
  labs(fill = "", x = "2017") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )


map_2018 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2018),
    color = NA
  ) +
  labs(fill = "", x = "2018") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2019 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2019),
    color = NA
  ) +
  labs(fill = "", x = "2019") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2020 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2020),
    color = NA
  ) +
  labs(fill = "", x = "2020") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2021 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2021),
    color = NA
  ) +
  labs(fill = "", x = "2021") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2022 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2022),
    color = NA
  ) +
  labs(fill = "", x = "2022") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2023 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2023),
    color = NA
  ) +
  labs(fill = "", x = "2023") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

map_2024 <- fude %>% 
  ggplot() +
  geom_sf(
    aes(fill = kousaku_2024),
    color = NA
  ) +
  labs(fill = "", x = "2024") +
  theme_minimal() +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme(
    legend.position = "none",
    axis.text = element_blank()
  )

# まとめて可視化
map_2017 + map_2018 + map_2019 + map_2020 +
  map_2021 + map_2022 + map_2023 + map_2024 + plot_layout(nrow = 2)

# ========== 耕作割合推移可視化 ========== #
ggplot() +
  geom_bar(aes(x = factor(2017), fill = fude$kousaku_2017)) +
  geom_bar(aes(x = factor(2018), fill = fude$kousaku_2018)) +
  geom_bar(aes(x = factor(2019), fill = fude$kousaku_2019)) +
  geom_bar(aes(x = factor(2020), fill = fude$kousaku_2020)) +
  geom_bar(aes(x = factor(2021), fill = fude$kousaku_2021)) +
  geom_bar(aes(x = factor(2022), fill = fude$kousaku_2022)) +
  geom_bar(aes(x = factor(2023), fill = fude$kousaku_2023)) +
  geom_bar(aes(x = factor(2024), fill = fude$kousaku_2024)) +
  labs(x = "", y = "frequency", fill = "") +
  scale_fill_manual(values = c("tomato", "cyan")) +
  theme_minimal()
