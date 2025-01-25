/*usersテーブルからデータ分析*/
SELECT age, COUNT(*)
FROM users
GROUP BY age;
/*usersテーブルを参照: このテーブルからage（年齢）ごとにデータをグループ化します。
GROUP BY句: age列でグループ化を行い、同じ年齢の行をまとめます。
例: 年齢が24歳のユーザーを1つのグループ、18歳のユーザーを別のグループとして扱う。
COUNT(*)関数: 各年齢グループに含まれる行数をカウントします。
これは実質的に、各年齢のユーザー数を取得します。
結果を返す: 年齢とその年齢のユーザー数を表示します。
*/

SELECT *
FROM items
WHERE name LIKE '%シャツ%';
/*WHERE
指定した条件に一致する行だけを取得します。
4. LIKE '%シャツ%'
name列に「シャツ」という文字列が含まれているデータを抽出します。
%: 任意の文字列を意味するワイルドカード。
'シャツ': この文字列が含まれているかをチェック。
'%シャツ%': 「前後に何かしらの文字列があってもよいが、'シャツ'という文字列が含まれている」ことを意味します。*/

SELECT SUM(items.price) AS "総売上", SUM(items.price - items.cost) AS "総利益"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id;
/*JOINsales_recordsとitemsをitem_idとidで結合し、販売記録ごとに対応する商品の価格（price）や原価（cost）を取得します。
SUM:SUM(items.price):
販売記録に基づいて、すべての商品の合計価格を計算します（総売り上げ）。
SUM(items.price - items.cost):
各販売記録について、price - cost（利益）を計算し、それらを合計します（総利益）。
結果：「総売り上げ」と「総利益」がそれぞれ1行の結果として返されます。*/

SELECT sales_records.purchased_at, SUM(items.price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY purchased_at
ORDER BY purchased_at ASC;
/*JOIN:
sales_recordsテーブルと itemsテーブルを結合します。
ON: sales_records.item_id = items.id:
sales_recordsテーブルの item_id列と itemsテーブルの id列が一致する行を結合します。
GROUP BY:
購入日時（purchased_at）でデータをグループ化します。
各購入日ごとの売上額を計算します。
*/