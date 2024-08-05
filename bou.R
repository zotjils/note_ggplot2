# データの読み込み
data_bou <- read_csv(file = "data_bou.csv")

# 基本のggplotオブジェクトの作成
bou <- ggplot(data_bou, aes(x = Variant, y = score, fill = Group))

# グラフの描画
bou + 
  # 棒グラフの描画
  geom_bar(position = position_dodge(width = 0.8), stat = "identity", colour = "black", width = 0.8, size = 0.35) + 
  # クラシックテーマとフォント設定
  theme_classic(base_family = "Helvetica Neue") + 
  # エラーバーの描画
  geom_errorbar(aes(ymin = score - error, ymax = score + error), width = 0.3, size = 0.35, position = position_dodge(width = 0.8)) + 
  # 軸ラベルと凡例の設定
  labs(x = "Variant Title", y = "Score Title", fill = "Group Title") + 
  # 色のカスタマイズとラベル設定
  scale_fill_manual(
    values = c("Group1" = "#222222", "Group2" = "#666666", "Group3" = "#aaaaaa", "Group4" = "#cccccc"),
    labels = c("Group1" = "Group1", "Group2" = "Group2", "Group3" = "Group3", "Group4" = "Group4")
  ) +
  # Y軸のスケール設定
  scale_y_continuous(breaks = c(1, 2, 3, 4, 5), limits = c(0, 5), expand = c(0, 0)) +
  # X軸のスケール設定
  scale_x_discrete(limits = c("A", "B", "C", "D"), labels = c("A", "B", "C", "D")) +
  # テーマの詳細設定
  theme(
    legend.position = "right", 
    legend.title = element_text(size = 14), 
    legend.text = element_text(size = 12),
    panel.grid = element_blank(),
    panel.border = element_blank(),
    axis.text = element_text(size = 12, colour = "black"), 
    axis.title = element_text(size = 14, colour = "black"),
    axis.ticks = element_line(colour = "black"),
    axis.line = element_line(colour = "black", size = 0.35),
    aspect.ratio = 0.7
  )
