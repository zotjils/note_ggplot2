# データの読み込み
data_oresen <- read_csv(file = "data_oresen.csv")

# 基本のggplotオブジェクトの作成
oresen <- ggplot(data_oresen, aes(x = Year))

# グラフの描画
oresen + 
  # クラシックテーマとフォント設定
  theme_classic(base_family = "Helvetica Neue") +
  # Group1の折れ線とポイント
  geom_line(aes(y = Group1), colour = "black", size = 0.35) +
  geom_point(aes(y = Group1, colour = "Group1"), shape = 16, size = 3) +
  # Group2の折れ線とポイント
  geom_line(aes(y = Group2), colour = "black", size = 0.35) +
  geom_point(aes(y = Group2, colour = "Group2"), shape = 16, size = 3) +
  # Group3の折れ線とポイント
  geom_line(aes(y = Group3), colour = "black", size = 0.35) +
  geom_point(aes(y = Group3, colour = "Group3"), shape = 17, size = 3) +
  # Group4の折れ線とポイント
  geom_line(aes(y = Group4), colour = "black", size = 0.35) +
  geom_point(aes(y = Group4, colour = "Group4"), shape = 17, size = 3) +
  # 軸ラベルの設定
  labs(x = "Year", y = "Score Title", color = "Label Title") +
  # 軸スケールの設定
  scale_y_continuous(breaks = seq(5, 35, by = 5), limits = c(0, 35), expand = c(0, 0)) +
  scale_x_continuous(breaks = seq(2014, 2023, by = 2)) +
  # 色のカスタマイズとラベル設定
  scale_color_manual(
    values = c("Group1" = "black", "Group2" = "#aaaaaa", "Group3" = "black", "Group4" = "#aaaaaa"),
    labels = c("Group1", "Group2", "Group3", "Group4")
  ) +
  # テーマの詳細設定
  theme(
    legend.position = "right", 
    legend.title = element_text(size = 12, color = "black"),
    legend.text = element_text(size = 10, color = "black"),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.text = element_text(size = 10, colour = "black"),
    axis.title = element_text(size = 12, colour = "black"),
    axis.ticks = element_line(colour = "black"),
    axis.line = element_line(colour = "black", size = 0.35),
    aspect.ratio = 0.7
  )
