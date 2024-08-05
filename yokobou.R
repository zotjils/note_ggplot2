# データの読み込み
data <- read_csv(file = "data_yokobou.csv")

# データをlong形式に変換
data_long <- gather(data, key = "Variant", value = "Value", -Group)
data_long$Variant <- factor(data_long$Variant, levels = c("D", "C", "B", "A"))
data_long$Group <- factor(data_long$Group, levels = c("Group4", "Group3", "Group2", "Group1"))

# パーセンテージ表示の関数
percentage_no_sign <- function(x) {
  return(sprintf("%d", x * 100))
}

# 基本のggplotオブジェクトの作成
yokobou <- ggplot(data_long, aes(x = Group, y = Value, fill = Variant))

# グラフの描画
yokobou +
  # 棒グラフの描画
  geom_bar(stat = "identity", position = "fill", width = 0.7) +
  # 軸ラベルと凡例の設定
  labs(x = "Group Title", y = "Percentage (%)", fill = "Variant Title") +
  # 色のカスタマイズ
  scale_fill_manual(values = c("A" = "#222222", "B" = "#666666", "C" = "#aaaaaa", "D" = "#cccccc")) +
  # Y軸のスケール設定
  scale_y_continuous(labels = percentage_no_sign, expand = c(0, 0)) +
  # クラシックテーマとフォント設定
  theme_classic(base_family = "Helvetica Neue") +
  # 横向き表示
  coord_flip() +
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
