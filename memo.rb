require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
 memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
 if memo_type == 1
  puts"拡張子を除いたファイルを入力してください"
  csv_name = gets
  puts"メモしたい内容を記入してください"
  puts"完了したら ctrl + D を押します"
  input = $stdin.read
   CSV.open("#{csv_name}.csv","w") do |csv|
   csv << [input]
  end
 elsif memo_type == 2
  puts"拡張子を除いた編集するファイル名を入力してください"
  csv_name = gets
   until FileTest.exist?("#{csv_name}.csv") do
   puts"該当ファイル名を確認しもう一度入力してください"
   csv_name = gets
   end
   file = CSV.open("#{csv_name}.csv","a+")
   puts"メモの内容を編集してください"
   puts"完了したら ctrl + D を押します"
   puts file.read
   input = $stdin.read
   CSV.open("#{csv_name}.csv","a") do |csv|
   csv << [input]
  end
 else
  puts"入力が正しくありません"
 end