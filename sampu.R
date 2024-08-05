# 必要なライブラリの読み込み
library(tidyverse)

# データの読み込み
data_sampu <- read_csv(file = "data_sampu.csv")

# 基本のggplotオブジェクトの作成
sampu <- ggplot(data_sampu, mapping = aes(X, Y))

# グラフの描画
sampu +
  # 散布図の描画、色分けはGroup列に基づく
  geom_point(aes(color = Group), size = 2.8) +
  # 色のカスタマイズ
  scale_color_manual(values = c("black", "#888888", "#bbbbbb", "#dddddd")) +
  # 軸ラベルの設定
  labs(x = "X Title", y = "Y Title", color = "Group Title") +
  # Y軸のスケール設定
  scale_y_continuous(breaks = seq(20, 100, by = 20), limits = c(0, 105), expand = c(0, 0)) +
  # X軸のスケール設定
  scale_x_continuous(limits = c(0, 1.05),expand = c(0, 0)) +
  # テーマの設定
  theme_bw() +  # ベーステーマ
  theme_classic(base_family = "Helvetica Neue") +  # クラシックテーマとフォント設定
  theme(panel.grid = element_blank()) +  # グリッド線の非表示
  # 回帰直線の描画
  geom_smooth(method = lm, se = FALSE, col = 'black', size = 0.3) +
  # 回帰方程式とR²値の表示
  stat_poly_eq(
    formula = y ~ x,
    aes(label = paste(stat(eq.label), stat(rr.label), sep = "~~~")),
    parse = TRUE
  )