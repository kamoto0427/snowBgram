crumb :root do
  link "ホーム画面", root_path
end

crumb :users do
  link "snowBユーザー", users_path, method: :get
end

crumb :mypage do
  link "#{current_user.name}のマイページ", user_path, method: :get
  parent :users
end

crumb :mypage_edit do
  link "マイページの編集", edit_user_path
  parent :mypage
end

crumb :posts do
  link "snowBの一覧ページ", posts_path, method: :get
end

crumb :post_new do
  link "snowBの新規投稿", new_post_path, method: :get
end

crumb :post_show do
  link "投稿の詳細ページ", post_path, method: :get
  parent :posts
end

crumb :post_edit do
  link "投稿の編集ページ", edit_post_path
  parent :post_show
end