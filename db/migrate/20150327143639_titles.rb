class Titles < ActiveRecord::Migration
  def change
      
    # [形式] add_column(テーブル名, カラム名, データ型)
    add_column :songs, :title, :string
      end
  end