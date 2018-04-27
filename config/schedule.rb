# # 出力先のログファイルの指定
# set :output, 'log/crontab.log'
# # ジョブの実行環境の指定
# set :environment, :production
# # every :hour do # Many shortcuts available: :hour, :day, :month, :year, :reboot
# every 1.minute do # 1.minute
#   command "mysql -u root -p"
#   runner "Trend.livedoor_news"
# end
